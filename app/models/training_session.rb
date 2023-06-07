class TrainingSession < ApplicationRecord
    belongs_to :coach
    has_many :users, through: :coach
    has_one_attached :image
end
