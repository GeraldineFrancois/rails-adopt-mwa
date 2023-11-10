class User < ApplicationRecord
  has_many :animals, dependent: :destroy

  # has_many :adoptions, dependent: :destroy
  acts_as_favoritor

  validates :first_name, :last_name, :phone, :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
