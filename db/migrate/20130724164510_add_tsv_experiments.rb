class AddTsvExperiments < ActiveRecord::Migration
  def up
    add_column :experiments, :tsv_record, :tsvector
    # update trigger
    connection.execute("CREATE TRIGGER experiments_tsvupdate BEFORE INSERT OR UPDATE ON experiments FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger(tsv_record, 'pg_catalog.english', project_name, owners, record_string)")
  end

  def down
    connection.execute("DROP TRIGGER experiments_tsvupdate ON experiments")
    remove_column :experiments, :tsv_record
  end
end
