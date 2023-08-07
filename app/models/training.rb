class Training < ApplicationRecord

    has_one_attached :image

    def training_image 
        if image.attached?
          image
            else
          "video_placeholder.jpg"
        end
    end

end
