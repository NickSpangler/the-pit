class Show < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :contributions
    has_many :contributors, through: :contributions, source: :contributor
    has_one_attached :logo
    has_rich_text :rich_synopsis
    has_rich_text :rich_character_list

    # scope :designs, -> { where('kind IN (?)', ["Costume", "Set"]) }

    validates :title, presence: { message: 'Please include a title for your show.' }
    validate :synopsis_present
    validate :characters_present

    def synopsis_present
        if rich_synopsis.empty?
            errors.add(:rich_synopsis, "Please include a synopsis of your show.")
        end
    end

    def characters_present
        if rich_character_list.empty?
            errors.add(:rich_character_list, "Please include at least one character in your show.")
        end
    end

    def songs
        contributions.where(kind: "Song")
    end

    def scenes
        contributions.where(kind: "Scene")
    end

    def designs
        contributions.where('kind IN (?)', ["Costume", "Set"])
    end
end