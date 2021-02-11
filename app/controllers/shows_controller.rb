class ShowsController < ApplicationController
    def index
        shows = Show.all
        render json: shows.to_json(:except => [:updated_at, :created_at])
    end
end
