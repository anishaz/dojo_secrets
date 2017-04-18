class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @secret = Secret.new(secret_params)
    if @secret.save
      redirect_to user_path(current_user.id)
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Secret.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end

  private
  def secret_params
    params.require(:secret).permit(:content).merge(user: current_user)
  end
end
