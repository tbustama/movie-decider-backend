class Movie < ApplicationRecord
    has_many :likes, :as => :movie
end
