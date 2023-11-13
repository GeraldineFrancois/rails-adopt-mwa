Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :animals do
    resources :favourites, only: [:index, :create, :destroy]
    resources :adoptions, only: [:show, :new, :create, :show_my]
    get "show_my", to: "adoptions#show_my", as: :adoption_requests
    member do
      post 'toggle_favorite', to: "animals#toggle_favorite"
    end
  end

  resources :adoptions, only: :index

  resources :users, only: [:show, :edit, :update] do
    get 'favorites', to: "users#favorites", on: :member
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
