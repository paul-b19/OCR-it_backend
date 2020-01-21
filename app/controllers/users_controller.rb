class UsersController < ApplicationController

  # GET /users/
  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  # GET /users/:id
  def show
    user = User.find(user_params[:id])
    render json: user.to_json(:include => {
      :records => {:only => [:id, :group, :title, :body, :confidence, :user_id]}
    }, :except => [:created_at, :updated_at])
  end

  # POST /users/
  def create
    user = User.new(
      username: user_params[:username],
      password: user_params[:password])
    if user.save
      render json: user, except: [:password, :created_at, :updated_at]
    else
      render json: {errors: user.errors.full_messages}
    end

  end

  # def create
  #   user = LoginHandler.new(user_params).check_user
  #   render json: user, except: [:created_at, :updated_at]
  # end

  private

  def user_params
    params.permit(:id, :username, :password, :action_type)
  end

end