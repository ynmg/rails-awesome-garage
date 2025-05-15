class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
    @car = Car.find(params[:car_id])
  end

  # def new
  #   @favourite = Favourite.new
  # end

  def create
    @favourite = Favourite.new(favourite_params)
    if Favourite.exists?(car_id: @favourite.car_id)
      render "cars/show", status: :unprocessable_entity
    else
      @favourite.save
      redirect_to favourites_path
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourite_path(@favourite)
  end

  private

  def favourite_params
    params.require(:favourite).permit(:car_id)
  end
end
