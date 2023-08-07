class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users
  has_one_attached  :avatar

  def avatar_thumbnail
    if avatar.attached?
      avatar
        else
      "/assets/user.png"
    end
  end

  # def avatar_url
  #   if avatar.attached?
  #     rails_blob_path(avatar, only_path: true)
  #   else
  #     "/assets/user.png"
  #   end
  # end
  
  

  def avatar_profile 
    if avatar.attached?
      avatar
        else
      "/assets/user.png"
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    "#{address} #{city}"
  end

  # coach_type enum 
  enum coach_type: { coach: "coach", admin: "admin", manager: "manager" }

end
