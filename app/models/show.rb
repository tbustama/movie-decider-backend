class Show < ApplicationRecord
    has_many :likes, :as => :show
    has_many :users, through: :likes
end
