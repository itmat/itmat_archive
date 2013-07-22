require "json"

namespace :data do
    desc "Loads a JSON file into the database"
    task load: :environment do
        unless ENV.has_key? "PD"
            raise Exception.new("No project name and/or archive json file given. Usage: rake data:load PD=path/to/experiment/directory")
        end
        pd = ENV["PD"]
        unless File.file?(File.join(pd,"README.json"))
            raise Exception.new("No README.json file found in project directory #{pd}")
        end
        r  = File.read(File.join(pd,"README.json"))
        puts "record: #{r[0..100]}..."
        jf = JSON.parse(r)
        e = Experiment.where(
            qinteract_project_id: jf["project_id"],
            project_name: jf["project_name"]
        ).first_or_create!
        e.owners = jf['owners']
        e.archive_folder_name = jf['archive_folder_name']
        e.record_string = r
        e.save
    end

    desc "Delete an experiment from the database"
    task delete: :environment do
        unless ENV.has_key? 'EID'
            raise Exception.new("No experiment given. Usage: rake data:delete EID=123")
        end
        Experiment.destroy(ENV['EID'])
    end

    desc "Deletes ALL experiments from the database"
    task delete_all: :environment do
        Experiment.delete_all
    end
end
