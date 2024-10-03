class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  enum role: { tester: 0, admin: 1 }

  validates :username, presence: true, uniqueness: true
end
