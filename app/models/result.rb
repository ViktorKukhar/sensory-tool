class Result < ApplicationRecord
  belongs_to :session
  belongs_to :user
  has_many :answers, dependent: :destroy
end
