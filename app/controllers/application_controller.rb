class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user #Any method we add to the ApplicationController will be available in ALL of our controllers. We make it so that the method is available in all of our views by using helper_method
end
