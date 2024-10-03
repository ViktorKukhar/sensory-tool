class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :tester, class_name: 'User'
  belongs_to :session

  validates :answer_value, presence: true
end
