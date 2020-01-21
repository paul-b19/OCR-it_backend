class UsersController < ApplicationController

  # GET /users/
  # def index
  #   users = User.all
  #   render json: users, except: [:created_at, :updated_at]
  # end

  # GET /users/:id
  def show
    user = User.find(user_params[:id])
    render json: user.to_json(:include => {
      :records => {:only => [:id, :group, :title, :body, :confidence, :user_id]}
    }, :except => [:created_at, :updated_at])
  end

  # POST /users/  for signup
  def create
    user = User.new(
      username: user_params[:username],
      password: user_params[:password])
    if user.save
      render json: user, except: [:password_digest, :created_at, :updated_at]
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  # POST /users/  for login
  def login
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      render json: user, except: [:password_digest, :created_at, :updated_at]
    else
      render json: {errors: "Wrong Password!"}
    end
  end

  private

  def user_params
    params.permit(:id, :username, :password)
  end

end