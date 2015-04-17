class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    if login(user_session_params[:email], user_session_params[:password])
      redirect_back_or_to root_url, notice: t('user_sessions.login_created')
    else
      flash.now[:alert] = t('user_sessions.login_failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "#{t('user_sessions.login_destroyed')}"
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
