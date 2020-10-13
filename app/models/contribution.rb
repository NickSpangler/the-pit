class Contribution < ApplicationRecord
    belongs_to :contributor, :class_name => "User", :foreign_key => :user_id
    belongs_to :show
end
