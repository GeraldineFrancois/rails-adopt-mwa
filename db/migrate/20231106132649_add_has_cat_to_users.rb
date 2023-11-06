class AddHasCatToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_cat, :boolean
  end
end
