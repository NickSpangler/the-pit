class Contribution < ApplicationRecord
    belongs_to :contributor, class_name: "User", foreign_key: :user_id
    belongs_to :show
    has_rich_text :rich_content
    has_one_attached :image
    has_one_attached :audio_file

    validates :title, presence: true

    def attached_image
        if kind == "Set" || kind == "Costume" && !image.attached
            errors.add(:image, "You must upload an image.")
        end
    end
end
