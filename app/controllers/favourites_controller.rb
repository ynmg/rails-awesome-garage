class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def create
    # we just need the car_id to know which car
    @car = Car.find(params[:car_id])
    @favourite = Favourite.new
    @favourite.car = @car
    if @favourite.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
      # we are in favourites controller so need to put car
    end
    # if Favourite.exists?(car_id: @favourite.car_id)
    #   render "cars/show", status: :unprocessable_entity
    # else
    #   @favourite.save
    #   redirect_to favourites_path
    # end
  end
  
  # def new
  #   @favourite = Favourite.new
  # end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def favourite_params
    params.require(:favourite).permit(:car_id)
  end


end
