class Show < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :contributions
    has_many :contributors, through: :contributions, source: :contributor
end