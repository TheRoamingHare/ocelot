class CreateThoughtRecords < ActiveRecord::Migration
  def change
    create_table :thought_records do |t|
      t.text :CurrentSituation
      t.text :Emotions
      t.integer :FirstEmotionStrength
      t.text :AutoThoughts
      t.text :AltResponse
      t.integer :SecondEmotionStrength

      t.timestamps null: false
    end
  end
end
