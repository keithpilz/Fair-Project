class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has subscribed!'
    else
      flash[:error] = 'This email address is already subscribed'
    end
    redirect_to subscribe_path
  end

  def admin_login
    @user = User.new
  end

  def admin_authenticate
    @user = User.authenticate(user_params)
    if @user && @user.is_admin
      p "sup"
    else
      flash[:error] = 'You aint no admin'
      redirect_to admin_login
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password_hash)
  end
end
