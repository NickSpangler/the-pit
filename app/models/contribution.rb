class Contribution < ApplicationRecord
    belongs_to :contributor, class_name: "User", foreign_key: :user_id
    belongs_to :show
    has_one_attached :image
    has_one_attached :audio_file
end
