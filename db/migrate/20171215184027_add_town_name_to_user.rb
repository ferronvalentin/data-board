class AddTownNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :town_name, :string
  end
end
