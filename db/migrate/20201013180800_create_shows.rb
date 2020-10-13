class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :synopsis
      t.text :character_list
      t.integer :creator_id

      t.timestamps
    end
  end
end
