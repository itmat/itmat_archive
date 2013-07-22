class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :qinteract_project_id
      t.string :project_name
      t.string :owners
      t.string :archive_disk
      t.string :archive_folder_name
      t.text :record_string
    end
  end
end
