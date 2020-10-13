class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.integer :show_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.text :note_from_creator
      t.boolean :accepted
      t.integer :pending_id

      t.timestamps
    end
  end
end
