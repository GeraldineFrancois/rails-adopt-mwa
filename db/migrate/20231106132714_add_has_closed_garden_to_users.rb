class AddHasClosedGardenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_closed_garden, :boolean
  end
end
