class Show < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :contributions
    has_many :contributors, through: :contributions, source: :contributor
    has_one_attached :logo
    has_rich_text :rich_synopsis
    has_rich_text :rich_character_list

    validates :title, presence: true

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