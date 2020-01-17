class UsersController < ApplicationController

  # GET /users/
  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  # GET /users/:id
  def show
    user = User.find(user_params[:id])
    # render json: user, include: [:records], except: [:created_at, :updated_at]
    render json: user.to_json(:include => {
      :records => {:only => [:id, :group, :title, :body, :confidence, :user_id]}
    }, :except => [:created_at, :updated_at])
  end

  # POST /leaders/
  def create
    user = User.create!(user_params)
    render json: user, except: [:created_at, :updated_at]
  end

  private

  def user_params
    params.permit(:id, :username, :password)
  end

end