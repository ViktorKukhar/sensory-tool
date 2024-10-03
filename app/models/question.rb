class Question < ApplicationRecord
  belongs_to :template
  has_many :answers, dependent: :destroy

  validates :input_type, inclusion: { in: %w(text dropdown radio rating), message: "%{value} is not a valid input type" }
end
