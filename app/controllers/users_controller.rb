class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :delete]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @secrets = @user.secrets
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash['errors'] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    reset_session
    redirect_to registration_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to current_user if current_user != user
  end
end
