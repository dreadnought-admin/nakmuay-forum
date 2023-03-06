Rails.application.routes.draw do

  mount ActionCable.server => "/cable"
  resources :messages, only: %i(index create)

  #posts and users
  resources :posts
  resources :users

  #votes

  resources :votes

  #signin & authentication
  get 'sessions/create'
  get 'sessions/destroy'

  post "/login", to: "sessions#create"
  get "/auth", to: "users#show"
  delete "/logout", to: "sessions#destroy"

  post "/signup", to: "users#create"

  #watches 
  resources :users, only: [:index, :show, :create, :destroy] do
    resources :watches
  end

  resources :watches, only: [:index, :show, :create, :destroy]

  #randomized routes
  get "/randomized", to: "posts#randomzied"

end
