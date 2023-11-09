Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :animals do
    resources :favourites, only: [:index, :create, :destroy]
    resources :adoptions, only: [:index, :show, :new, :create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
