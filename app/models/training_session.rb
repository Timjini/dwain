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

    enum set:{
      "1" => 1
    }

    RPE_OPTIONS = [
    ['Very Light Activity: 1', '1'],
    ['Light Activity: 2-3', '2-3'],
    ['Moderate Activity: 4-6', '4-6'],
    ['Vigorous Activity: 7-8', '7-8'],
    ['Very Hard Activity: 9', '9'],
    ['Max Effort Activity: 10', '10']
  ].freeze

  def self.rpes
    RPE_OPTIONS
  end

    # enum day: {
    #   "Monday" => 1,
    #   "Tuesday" => 2,
    #   "Wedneday" => 3,
    #   "Thursday"=>4
    # }
end
