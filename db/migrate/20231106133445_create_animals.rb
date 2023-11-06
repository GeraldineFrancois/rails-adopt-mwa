class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :breed
      t.string :name
      t.integer :age
      t.boolean :ok_sterilised
      t.boolean :ok_vaccinated
      t.boolean :has_handicap
      t.boolean :ok_dog
      t.boolean :ok_cat
      t.boolean :ok_play
      t.boolean :ok_calm
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
