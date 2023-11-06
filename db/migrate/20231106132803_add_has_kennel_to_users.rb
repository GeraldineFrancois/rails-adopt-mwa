class AddHasKennelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_kennel, :boolean
  end
end
