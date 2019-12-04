Rails.application.routes.draw do
  devise_for :users

  resources :playlists, except: [:new, :create]

  resources :users do
    resources :playlists, only: [:new, :create]
    resources :follows, only: [:create, :destroy]
  end


  resources :episodes, only: [:index, :show] do
    # resources :playlists, only: [:new, :create]
    resources :playlist_episodes, only: [:new, :create]
    resources :comments, only: [:create]
    member do
      put "like" => "episodes#upvote"
      put "unlike" => "episodes#downvote"
    end
  end

  resources :comments, except: [:create,:new, :show]
  get "/search", to: 'pages#search'

  # post "/follows/:id", to: 'follows#create', as: :follows
  # delete "/follows/:id", to: 'follows#destroy', as: :follows

  get "/search", to: 'pages#search'
  root to: 'pages#home'

  get "/random_podcast", to: "pages#random_podcast"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
