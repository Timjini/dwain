class Athlete < ApplicationRecord
    belongs_to :user , optional: true
    enum level: {
    development: 0,
    intermediate: 1,
    advanced: 2
  } 

   has_one_attached :image

   def image_thumbnail
    if image.attached?
      # avatar.variant(resize: "150x150!").processed
      image
    else
      "/assets/user.png"
    end
  end

    def age
    now = Time.now.utc.to_date
    if dob.nil?
      return "undefined"
    else
    now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
    end
  end

   def athlete_category
    case age 
    when 0..12
      "Child"
    when 13..18
      "Junior"
    when 19..60
      "Senior"
    end
  end

  def athlete_full_name
    "#{first_name} #{last_name}"
  end
end
