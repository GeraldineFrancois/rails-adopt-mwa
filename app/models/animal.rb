class Animal < ApplicationRecord
  COMPATIBILITY = %w[dog cat]
  BEHAVIOURS = %w[playful calm aggressive]

  belongs_to :user
  has_many :adoptions, dependent: :destroy
  acts_as_favoritable
  has_one_attached :photo

  # validates :breed, :name, :age, :ok_vaccinated, :behaviour, :location, presence: true
  # validates :breed, inclusion: { in: %w(dog cat)}
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


end
