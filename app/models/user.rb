class User < ApplicationRecord
  has_many :animals
  has_many :adoptions

  validates :first_name, :last_name, :phone, :address, :has_dog, :has_cat, :has_closed_garden, :has_basket, :has_kennel, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
