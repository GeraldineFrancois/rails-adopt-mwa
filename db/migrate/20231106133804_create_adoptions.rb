class CreateAdoptions < ActiveRecord::Migration[7.0]
  def change
    create_table :adoptions do |t|
      t.date :start_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
