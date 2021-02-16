class LikesController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
  def create
    media_type = params["media_type"] == "movies" ? "Movie" : "Show"
    like = {
      user_id: params["user_id"],
      media_id: params["media_id"],
      media_type: media_type
    }
    Like.create(like)
  end
end
