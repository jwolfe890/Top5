Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'profile', to: 'users#show', as: :profile

  root 'welcome#home'

  post '/lists/:id' => 'lists#destroy', :as => :destroy_list

  resources :users do
    resources :lists
  end

  resources :lists do
    resources :ratings, only: [:create]
  end

  match '*path' => redirect('/'), via: :get

end

