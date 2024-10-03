class Session < ApplicationRecord
  belongs_to :template
  belongs_to :user # admin who created the session
  has_many :results, dependent: :destroy
  has_many :answers, through: :results

  validates :status, inclusion: { in: %w(open closed), message: "%{value} is not a valid status" }
end
