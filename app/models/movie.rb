class Movie < ApplicationRecord
    has_many :likes, as: :movie
    has_many :users, through: :likes
end
