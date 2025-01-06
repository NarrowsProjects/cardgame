class StaticPagesController < ApplicationController
  def home; end
  def login_page; end

  def login
    user = User.find_by(username: user_params[:username], password: user_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to game_page_path
    else
      flash[:alert] = "Invalid username or password"
      redirect_to login_page_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
