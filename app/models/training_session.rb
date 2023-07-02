class TrainingSession < ApplicationRecord
    belongs_to :coach
    has_many :users, through: :coach
    has_one_attached :image

    # def training_image_url
    #     if image.attached?
    #         rails_blob_path(image, only_path: true)
    #   end
    # end

    def training_image 
        if image.attached?
          image
            else
          "video_placeholder.jpg"
        end
    end

    def training_small 
        if image.attached?
          image.variant(resize_to_fill: [60, 60]).processed
            else
          "video_placeholder.jpg"
        end
    end
end
