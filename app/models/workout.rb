class Workout < ApplicationRecord
  belongs_to :coach

    has_one_attached :image
    has_one_attached :video


    def video_url
        if video.attached?
            video.url
        else
            "/assets/user.mp4"
        end
    end

    def image_url
        if image.attached?
            image.url
        end
    end

    def image_thumbnail
    if image.attached?
      image.variant(resize_to_fill: [60, 60]).processed
        else
      "/assets/user.png"
    end
  end

end