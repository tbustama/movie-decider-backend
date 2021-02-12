class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :likes
    has_many :medias, through: :likes, source_type: :Movie
    has_many :medias, through: :likes, source_type: :Show
    has_many :shows, through: :liks
end
