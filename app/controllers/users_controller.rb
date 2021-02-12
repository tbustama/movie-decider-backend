class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def signin
    # byebug
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {'error': "Username or password is invalid", 'status': 400}
    end
  end

  def create
    @user = User.create(user_params)
    # if @user.valid?
    #   @token = encode_token({ user_id: @user.id })
    #   render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    # else
    #   render json: { error: 'failed to create user' }, status: :not_acceptable
    # end
    render json: @user
  end

  def index
    users = User.all
    render json: users
  end
  
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def profile
    byebug
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  

  private

  def user_params
    params.permit(:username, :password)
  end
end 
