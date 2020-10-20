class User < ApplicationRecord
    has_secure_password validations: false
    has_many :created_shows, class_name: "Show", foreign_key: :creator_id
    has_many :contributions
    has_many :contributed_shows, through: :contributions, source: :show
    validates :name, presence: { message: 'Please enter your name.' }, uniqueness: { message: 'A user already has that name.' }
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => 'Please enter a valid email address.'
    validates :email, uniqueness: { message: 'A user already has that email.' }
    validates :password, presence: { message: 'Please enter a password.' }
    validates :password, confirmation: { message: 'Password must match password confirmation.' }

end
