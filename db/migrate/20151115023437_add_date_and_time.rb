class AddDateAndTime < ActiveRecord::Migration
  def change
    add_column :activity_logs, :LogDate, :string
    add_column :activity_logs, :LogWindow, :integer

    add_index :activity_logs, :LogDate
  end
end
