class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_email(params[:user][:Email])# Log User In
    if @user && @user.authenticate(params[:user][:Password])# if authenticate true
      session[:user_id] = @user.id# save user id to session
      redirect_to user_path(@user)# redirect to users profile page
    else # if authenticate false
      flash[:errors] = ["Invalid Combination"] # add an error message -> flash[:errors] = ["Invalid"]
      redirect_to :back # redirect to login page
    end
  end

  def destroy
    session[:user_id] = nil # set session[:user_id] to null
    redirect_to login_path# redirect to login page
  end
end