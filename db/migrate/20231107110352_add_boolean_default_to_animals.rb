class AddBooleanDefaultToAnimals < ActiveRecord::Migration[7.0]
  def change
    change_column :animals, :ok_sterilised, :boolean, default: false
    change_column :animals, :ok_vaccinated, :boolean, default: false
  end
end
