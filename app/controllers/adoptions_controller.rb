class AdoptionsController < ApplicationController
  before_action :set_animal, only: %i[create show new]

  def index
    @adoptions = current_user.adoptions
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.animal = @animal
    @adoption.user = current_user
    if @adoption.save
      redirect_to animal_adoption_path(@adoption.animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def adoption_params
    params.require(:adoption).permit(:start_date, :status)
  end
end
