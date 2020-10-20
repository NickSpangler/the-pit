class RemoveColumnsFromContributions < ActiveRecord::Migration[6.0]
  def change
    remove_column :contributions, :content, :text
    remove_column :contributions, :note_from_creator, :text
    remove_column :contributions, :accepted, :boolean
    remove_column :contributions, :pending_id, :integer
  end
end
