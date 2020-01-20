class LoginHandler

  def initialize(user_params)
    @user_params = user_params
  end

  def check_user()
    if @user_params[:action_type] === 'logIn'
      user = User.where(username: @user_params[:username]).take
    end
    user
  end

end