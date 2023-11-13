class AddDefaultStatusToAdoptions < ActiveRecord::Migration[7.0]
  def change
    change_column :adoptions, :status, :string, default: 'pending'
  end
end
