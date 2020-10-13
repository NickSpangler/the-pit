class User < ApplicationRecord
    has_secure_password
    has_many :created_shows, :class_name => "Show", :foreign_key => :creator_id

end
