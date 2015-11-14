class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.text :CurrentActivity
      t.integer :CurrentMood

      t.timestamps null: false
    end
  end
end
