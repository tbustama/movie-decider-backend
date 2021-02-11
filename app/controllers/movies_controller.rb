class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies.to_json(:except => [:updated_at, :created_at])
    end
end
