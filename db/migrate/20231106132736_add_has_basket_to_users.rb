class AddHasBasketToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_basket, :boolean
  end
end
