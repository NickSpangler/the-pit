class Contribution < ApplicationRecord
    belongs_to :contributor, class_name: "User", foreign_key: :user_id
    belongs_to :show
    has_rich_text :rich_content
    has_one_attached :image
    has_one_attached :audio_file
    scope :most_recent, -> { order('created_at desc') }

    validates :title, presence: { message: 'Please include a title for your contribution.' }
    validate :scene_content
    validate :image_attached
    validate :song_attached

    def image_attached
        if kind == "Set" || kind == "Costume"
            if !image.attached?
                errors.add(:image, "Please upload an image of your design.")
            end
            if rich_content.empty?
                errors.add(:rich_content, "Please include a description of your design.")
            end
        end
    end

    def scene_content
        if kind == "Scene" && rich_content.empty?
            errors.add(:rich_content, "Please include some content in your scene.")
        end
    end

    def song_attached
        if kind == "Song" && !audio_file.attached?
            errors.add(:audio_file, "Please upload a recording of your song.")
        end
    end
end
