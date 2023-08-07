class Team < ApplicationRecord
  belongs_to :coach
  has_many :team_memberships , dependent: :destroy
  has_many :users, through: :team_memberships
  has_one_attached :logo

  def logo_thumbnail
     if logo.attached?
      logo
        else
      "/assets/user.png"
    end
  end

end
