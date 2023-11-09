class AdoptionsController < ApplicationController
  before_action :set_animal, only: %i[create]

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.animal = @animal
    if @adoption.save
    redirect_to animal_path(@animal)
    else
      render "animals/show", status: :unprocessable_entity
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
