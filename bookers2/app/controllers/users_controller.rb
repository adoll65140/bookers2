class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @bookers = @user.bookers.page(params[:page]).reverse_order
    @booker = Booker.new
  end
  
  def index
    @users = User.all
    @user = current_user
    @booker = Booker.new
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] ="successfully updated"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end 
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
