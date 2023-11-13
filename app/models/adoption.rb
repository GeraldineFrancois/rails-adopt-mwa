class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_date, presence: true

  enum status: {
    approved: 'approve',
    rejected: 'reject',
    pending: 'pending'
  }, _default: 'pending'
end
