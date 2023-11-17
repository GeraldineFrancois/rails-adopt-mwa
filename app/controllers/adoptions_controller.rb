class AdoptionsController < ApplicationController
  before_action :set_animal, only: %i[create show new show_my]

  def index
    @adoptions = current_user.adoptions
    @requests = current_user.animals.map(&:adoptions).flatten
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def show_my
    @adopter = @animal.user
    @adoption = Adoption.find(params[:id])
    @conditions = [@adopter.has_dog, @adopter.has_cat, @adopter.has_closed_garden, @adopter.has_basket, @adopter.has_kennel]
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
    @adoption = Adoption.new
    @chatroom = Chatroom.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.animal = @animal
    @adoption.user = current_user
    if @adoption.save
      @chatroom = Chatroom.new
      @chatroom.adoption = @adoption
      @chatroom.save
      redirect_to animal_adoption_path(@animal, @adoption)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @adoption = Adoption.find(params[:id])
    @adoption.update(adoption_params)
    redirect_to adoptions_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def adoption_params
    params.require(:adoption).permit(:start_date, :status)
  end
end
