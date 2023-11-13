class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_date, presence: true

  enum status: {
    approved: 'aprroved',
    rejected: 'rejected',
    pending: 'pending'
  }, _default: 'pending'
end
