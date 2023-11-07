class ReplaceColumnsInAnimals < ActiveRecord::Migration[7.0]
  def change
    remove_column :animals, :has_handicap, :boolean
    add_column :animals, :handicapped, :boolean, default: false
    remove_column :animals, :ok_cat, :boolean
    remove_column :animals, :ok_dog, :boolean
    remove_column :animals, :ok_play, :boolean
    remove_column :animals, :ok_calm, :boolean
    add_column :animals, :behaviour, :string
  end
end
