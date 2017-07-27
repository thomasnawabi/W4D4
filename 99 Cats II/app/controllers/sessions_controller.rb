class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:users][:user_name], params[:users][:password])
    login_user!(user)
    user.save!
    redirect_to cats_url
  end

  def destroy
    unless current_user.nil?
      # debugger
      logout
    end
    redirect_to cats_url
  end

end
