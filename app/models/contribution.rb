class Contribution < ApplicationRecord
    belongs_to :contributor, class_name: "User", foreign_key: :user_id
    belongs_to :show
    has_rich_text :rich_content
    has_one_attached :image
    has_one_attached :audio_file

    validates :title, presence: { message: 'Please include a title for your contribution.' }
    validate :scene_content

    def attached_image
        if kind == "Set" || kind == "Costume" && !image.attached
            errors.add(:image, "You must upload an image.")
        end
    end

    def scene_content
        if rich_content.empty?
            errors.add(:rich_content, "Please include some content in your scene.")
        end
    end
end
