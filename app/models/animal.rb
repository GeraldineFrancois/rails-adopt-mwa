class Animal < ApplicationRecord
  COMPATIBILITY = %w[dog cat]
  BEHAVIOURS = %w[playful calm aggressive]

  belongs_to :user
  has_one :adoption
  validates :breed, :name, :age, :ok_vaccinated, :behaviour, :location, presence: true
end
