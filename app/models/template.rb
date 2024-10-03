class Template < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :sessions, dependent: :destroy

  validates :name, presence: true
end
