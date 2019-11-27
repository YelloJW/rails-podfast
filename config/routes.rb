Rails.application.routes.draw do
  devise_for :users
  # resources :users do
  #   resources :playlists
  # end

  resources :episodes, only: [:index, :show] do
    member do
      put "like" => "episodes#upvote"
      put "unlike" => "episodes#downvote"

    end
  end
  root to: 'pages#home'
  get "/search", to: 'pages#search'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
