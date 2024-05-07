class HomeController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.valid_password?(user_params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'Sign in successful!'
    else
      @user = User.new(user_params)

      if @user.save
        sign_in(@user)
        redirect_to root_path, notice: 'Sign up successful!'
      else
        flash.now[:alert] = 'Invalid email or password. Failed to register.'
        render :index
      end
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
