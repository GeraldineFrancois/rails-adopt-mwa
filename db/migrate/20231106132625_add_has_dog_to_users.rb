class AddHasDogToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_dog, :boolean
  end
end
