class Show < ApplicationRecord
    belongs_to :creator, :class_name => "User"
    has_many :contributions
end