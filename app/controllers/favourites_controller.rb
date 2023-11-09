class FavouritesController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @favourites = Favourite.all
  # end

  def create
    @animal = Animal.find(params[:animal_id])
    current_user.favourites.create(animal: @animal)
    redirect_to @animal, notice: 'Added to favourites!'
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    current_user.favourites.find_by(animal: @animal).destroy
    redirect_to @animal, notice: 'Removed from favourites!'
  end

end
