class Movie < ApplicationRecord
    has_many :likes, as: :movie
    has_many :users, through: :likes

    def self.comma
        shows = Movie.all
        shows.each{|show| show.update(synopsis: show.split_str)}
    end

    def split_str
        arr = self.synopsis.split(' ')
        newArr = arr.map do |word|
            word.gsub('&#39;', "'")
        end
        newArr.join(' ')
    end
end
