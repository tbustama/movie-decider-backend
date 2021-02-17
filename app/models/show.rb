class Show < ApplicationRecord
    has_many :likes, :as => :show
    has_many :users, through: :likes
    
    def self.comma
        shows = Show.all
        shows.each{|show| show.update(synopsis: show.split_str)}
        shows.each{|show| show.update(title: show.split_title)}
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
