class AddUserRefToActivityLogs < ActiveRecord::Migration
  def change
    add_reference :activity_logs, :User, index: true, foreign_key: true
  end
end
