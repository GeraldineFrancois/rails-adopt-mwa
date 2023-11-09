class AdoptionsController < ApplicationController

  def index
    @adoptions = Adoption.all
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def new
    @adoption = Adoption.new
  end

  def create
    
  end
end
