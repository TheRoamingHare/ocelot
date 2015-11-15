class AddActivityLogRefToThoughtRecord < ActiveRecord::Migration
  def change
    add_reference :thought_records, :activity_log, index: true, foreign_key: true
  end
end
