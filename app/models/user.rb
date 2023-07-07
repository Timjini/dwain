class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  belongs_to  :coach , optional: true

  has_many :team_memberships
  has_many :teams, through: :team_memberships

  has_one :subscription

  def age
    now = Time.now.utc.to_date
    if dob.nil?
      return "undefined"
    else
    now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
    end
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/assets/user.png"
    end
  end

  def user_category
    case age 
    when 0..12
      "Child"
    when 13..18
      "Junior"
    when 19..60
      "Senior"
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    "#{address} #{city}"
  end
end
