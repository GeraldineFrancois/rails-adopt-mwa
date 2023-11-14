class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @animals = Animal.left_joins(:adoptions)
                     .where('adoptions.status != ?', 'approved')

  def my_animals
    @user_animals = current_user.animals
  end

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
    # authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    # authorize @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
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


  def toggle_favorite
    @animal = Animal.find(params[:id])

    if current_user.favorited?(@animal)
      current_user.unfavorite(@animal)
      redirect_to animals_path, notice: "Animal unfavorited succesfully!"
    else
      current_user.favorite(@animal)
      redirect_to animals_path, notice: "Animal favorited succesfully!"
    end
  end


  private

  def animal_params

    params.require(:animal).permit(:name, :breed, :age, :ok_sterilised, :ok_vaccinated, :handicapped,  :ok_cat, :ok_play, :ok_calm, :description, :location, photos: [])

  end

end
