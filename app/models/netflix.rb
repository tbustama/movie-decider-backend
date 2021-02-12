class Netflix < ApplicationRecord
    def self.series
        all = Netflix.all
        series = all.select{|netflix| netflix.vtype == 'series'}
        sorted_series = series.sort_by{|show| show.rating}.reverse
        
        return sorted_series.length
    end

    def self.movies
        all = Netflix.all
        movies = all.select{|netflix| netflix.vtype == 'movie'}
        sorted_movies = movies.sort_by{|movie| movie.rating }.reverse
       
        return sorted_movies.length
    end

    def self.update
        unrated = Netflix.all.select{|netflix| !netflix.rating}
        unrated.each{|unrated| unrated.update(vtype: 0)}
    end
end
