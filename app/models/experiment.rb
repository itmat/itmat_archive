require "json"
class Experiment < ActiveRecord::Base
    serialize :owners, Array

    attr_accessible :qinteract_project_id, :project_name, :owners,
        :archive_disk, :achive_folder_name, :record_string

    def record
        @record ||= JSON.parse(record_string)
    end
    def record=(json_record)
        self.record_string = json_record.to_s()
    end

    include PgSearch
    pg_search_scope :search, against: [:project_name, :owners, :record_string],
        using: {
            tsearch: {
                dictionary: 'english',
                prefix: true,
                any_word: true,
                tsvector_column: 'tsv_record'
            }
        }
end
