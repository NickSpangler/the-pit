class User < ApplicationRecord
    has_secure_password
    has_many :created_shows, class_name: "Show", foreign_key: :creator_id
    has_many :contributions
    has_many :contributed_shows, through: :contributions, source: :show

end
