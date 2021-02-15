class ShowsController < ApplicationController
    skip_before_action :authorized
    
    def index
        shows = Show.all
        render json: shows.to_json(:except => [:updated_at, :created_at])
    end
end
