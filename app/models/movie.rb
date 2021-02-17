class Movie < ApplicationRecord
    has_many :likes, as: :movie
    has_many :users, through: :likes

    def self.comma
        movies = Movie.all
        movies.each{|movie| movie.update(synopsis: movie.split_str)}
        movies.each{|movie| movie.update(title: movie.split_title)}
    end

    def split_str
        arr = self.synopsis.split(' ')
        newArr = arr.map do |word|
            word.gsub('&#39;', "'")
        end
        newArr.join(' ')
    end

    def split_title
        arr = self.title.split(' ')
        newArr = arr.map do |word|
            word.gsub('&#39;', "'")
        end
        newArr.join(' ')
    end
end
