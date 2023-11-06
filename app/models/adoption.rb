class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_date, :status, presence: true
end
