class User < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :adoptions, dependent: :destroy

  validates :first_name, :last_name, :phone, :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def favourite(animal)
    favourites.find_or_create_by(animal: animal)
  end

  def unfavourite(animal)
    favourites.where(animal: animal).destroy_all

    animal.reload
  end

  def favourited?(animal)
    favourites.find_by(animal_id: animal.id).present?
  end
end
