class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :image)
  end

end
