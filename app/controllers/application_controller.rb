class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def require_login
    redirect_to '/sessions/new' unless session[:user_id]
  end

  def current_user #Any method we add to the ApplicationController will be available in ALL of our controllers. We make it so that the method is available in all of our views by using helper_method
    User.find(session[:user_id]) if session[:user_id] #ruby has an implicit return so this function essentially returns an instance of @user
  end

  helper_method :current_user #can access this in our views (check application.html.erb)

end
