class ChangeThoughtFormFormat < ActiveRecord::Migration
  def change
    change_table :thought_records do |t|
      t.remove :FirstEmotionStrength, :SecondEmotionStrength
      t.text :Outcome
    end
  end
end
