class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Name
      t.integer :Zip
      t.integer :Age
      t.string :Email

      t.timestamps null: false
    end
  end
end
