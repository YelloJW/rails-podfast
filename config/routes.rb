Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :playlists
  end

  resources :episodes, only: [:index, :show] do
    resources :comments, only: [:create]
    member do
      put "like" => "episodes#upvote"
      put "unlike" => "episodes#downvote"
    end
  end

  resources :comments, except: [:create,:new, :show]

  get "/search", to: 'pages#search'
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
