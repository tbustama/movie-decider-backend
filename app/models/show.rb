class Show < ApplicationRecord
    has_many :likes, :as => :series
end
