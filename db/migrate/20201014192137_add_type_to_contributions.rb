class AddTypeToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :type, :string
  end
end