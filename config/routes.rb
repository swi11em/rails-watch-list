Rails.application.routes.draw do
  get 'movies/show'
  get 'movies/index'
  get 'bookmarks/new'
  get 'list/index'
  get 'list/show'
  get 'list/edit'
  get 'list/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :lists do
    resources :bookmarks, only: [:new]
  end
  resources :bookmarks, only: [:create, :destroy]


  resources :movies, only: [:show, :index]

  # Defines the root path route ("/")
  # root "posts#index"
end
