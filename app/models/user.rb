# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  username            :string
#  role                :integer          default("tester")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  enum role: { tester: 0, admin: 1 }

  validates :username, presence: true, uniqueness: true
end
