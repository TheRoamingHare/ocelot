class AddUserWakeAndSleep < ActiveRecord::Migration
  def change
    add_column :users, :NormalWake, :integer
    add_column :users, :NormalSleep, :integer
  end
end
