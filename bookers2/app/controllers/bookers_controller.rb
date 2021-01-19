class BookersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @bookers = Booker.all
    @booker = Booker.new(booker_params)
    @booker.user_id = current_user.id
    if @booker.save
       flash[:notice] = "You have creatad book successfully."
       redirect_to booker_path(@booker)
    else
       render :index
    end
  end

  def new
    @booker = Booker.new
  end

  def index
    @bookers = Booker.all
    @user = current_user
    @booker = Booker.new
  end

  def show
    @booker = Booker.find(params[:id])
    @booker = Booker.new
    @user = current_user
  end

  def destroy
    @booker = Booker.find(params[:id])
    @booker.destroy
    redirect_to bookers_path
  end

  def edit
    @booker = Booker.find(params[:id])
    if @booker.user_id != current_user.id
      redirect_to bookers_path
    end
  end

  def update
	  @booker = Booker.find(params[:id])
	  @booker.user_id = current_user.id
	  if @booker.update(booker_params)
	    flash[:notice] = "You have updated book successfully."
	    redirect_to booker_path(@booker)
	  else
	  	render 'edit'
	  end
  end

  private

  def booker_params
    params.require(:booker).permit(:title, :opinion)
  end

end
