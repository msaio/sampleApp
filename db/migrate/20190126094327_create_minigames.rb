class CreateMinigames < ActiveRecord::Migration[5.1]
  def change
    create_table :minigames do |t|
      t.integer :game_id
      t.text :content

      t.timestamps
    end
  end
end
