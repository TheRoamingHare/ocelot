class ChangeDefaultEmailValue < ActiveRecord::Migration
  def change
    change_column_default :users, :email, ""
  end
end
