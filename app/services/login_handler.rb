class LoginHandler

  def initialize(user_params)
    @user_params = user_params
  end

  def check_user()
    if @user_params[:action] === 'logIn' do
      user = User.where(username: @user_params[:username])[0]
    end
    user
  end

end