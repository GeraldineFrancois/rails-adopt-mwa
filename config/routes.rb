Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :animals do
    member do
      post 'toggle_favorite', to: "animals#toggle_favorite"
    end
  end


  resources :users, only: [:show, :edit, :update] do
    get 'favorites', to: "animals#favorites"
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
