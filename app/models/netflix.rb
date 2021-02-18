class Netflix < ApplicationRecord
    def self.series
        all = Netflix.all
        Like.destroy_all
        Show.destroy_all
        series = all.select{|netflix| netflix.vtype == 'series'}
        sorted_series = series.sort_by{|show| show.rating}.reverse
        sorted_series.each do |show|
            Show.create(title: show['title'], synopsis: show['synopsis'], vtype: show['vtype'], image: show['image'], year: show['year'], genre: show['genre'], rating: show['rating'], imdbrated: show['imdbrated'])
        end
        return sorted_series[0]
    end

    def self.movies
        Movie.destroy_all
        all = Netflix.all
        movies = all.select{|netflix| netflix.vtype == 'movie'}
        sorted_movies = movies.sort_by{|movie| movie.rating }.reverse
        sorted_movies.each do |movie|
            Movie.create(title: movie['title'], synopsis: movie['synopsis'], vtype: movie['vtype'], image: movie['image'], year: movie['year'], genre: movie['genre'], rating: movie['rating'], imdbrated: movie['imdbrated'])
        end
        return sorted_movies[0]
    end

    def self.update
        unrated = Netflix.all.select{|netflix| !netflix.rating}
        unrated.each{|unrated| unrated.update(vtype: 0)}
    end
end
