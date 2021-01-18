class BookersController < ApplicationController
  

  def create
    @booker = Booker.new(booker_params)
    @booker.user_id = current_user.id
    @booker.save
    redirect_to booker_path(@booker.id)
  end

  def index
    @bookers = Booker.all
    @booker = Booker.new
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def destroy
    @booker = Booker.find(params[:id])
    @booker.destroy
    redirect_to bookers_path
  end
  
  private
  
  def booker_params
    params.require(:booker).permit(:title, :opinion)
  end 
  
end
