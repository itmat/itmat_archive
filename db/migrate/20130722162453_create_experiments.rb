class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :location, size: 1000, null: false
      t.text :notes, null: false
    end
  end
end
