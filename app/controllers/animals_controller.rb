class AnimalsController < ApplicationController


  def index
    @animals = Animal.all

    @animals = policy_scope(Animal)

    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude
      }
    end

  end

  def show
    @animal = Animal.find(params[:id])
    authorize @animal
    @conditions = [@animal.ok_vaccinated, @animal.ok_sterilised, @animal.handicapped]
    @state = []
    @conditions.each do |condition|
      if condition
        @state << 'Yes'
      else
        @state << 'No'
      end
    end
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def update
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.update(animal_params)
    redirect_to animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.destroy

    redirect_to animals_path, status: :see_other
  end



  private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :ok_sterilised, :ok_vaccinated, :handicapped,  :ok_cat, :ok_play, :ok_calm, :location)
  end


end
