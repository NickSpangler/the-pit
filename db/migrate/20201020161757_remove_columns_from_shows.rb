class RemoveColumnsFromShows < ActiveRecord::Migration[6.0]
  def change
    remove_column :shows, :synopsis, :text
    remove_column :shows, :character_list, :text
  end
end
