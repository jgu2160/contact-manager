class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def find_resource
    class_name = params[:controller].singularize
    klass = class_name.camelize.constantize
    self.instance_variable_set "@" + class_name, klass.find(params[:id])
  end

  def current_user
    require 'byebug'; byebug
    @current_user ||= User.find(session[:user_id])
  end
end
