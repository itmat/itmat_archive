namespace 'db' do
    desc "Deletes all data from the database"
    task :delete_all => :environment do
        Experiment.delete_all
    end
end
