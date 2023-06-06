class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to  :coach , optional: true

  has_many :team_memberships
  has_many :teams, through: :team_memberships

  has_one :subscription
end
