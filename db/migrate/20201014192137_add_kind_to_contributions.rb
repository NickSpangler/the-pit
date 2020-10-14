class AddKindToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :kind, :string
  end
end