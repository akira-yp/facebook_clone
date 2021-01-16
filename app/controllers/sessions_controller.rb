class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to pictures_path
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger]="ログイン失敗しました"
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
