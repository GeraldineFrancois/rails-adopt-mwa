class UsersController < ApplicationController

  def show
    @user = current_user
    @conditions = [@user.has_dog, @user.has_cat, @user.has_closed_garden, @user.has_basket, @user.has_kennel]
    @state = []
    @conditions.each do |condition|
      if condition
        @state << 'Yes'
      else
        @state << 'No'
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_animals = @user.all_favorites.map { |favorite| Animal.find(favorite.favoritable_id) }
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone,
      :has_dog,
      :has_cat,
      :has_closed_garden,
      :has_basket,
      :has_kennel,
      photos: []
    )
  end
end
