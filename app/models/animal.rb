class Animal < ApplicationRecord
  belongs_to :user
  has_one :adoption
  validates :breed, :name, :age, :ok_sterilised, :ok_vaccinated, :has_handicap, :ok_dog, :ok_cat, :ok_play, :ok_calm, :location, presence: true
end
