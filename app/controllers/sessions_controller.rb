class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "#{user.name} logged in successfully"
  end

  def destroy
    User.destroy(session[:user_id])
    redirect_to root_path, notice: "Logged out successfully"
  end
end
