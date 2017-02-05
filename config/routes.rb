Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'profile', to: 'users#show', as: :profile

  root 'welcome#home'

  resources :lists

  resources :ratings

  resources :users do
    resources :lists
  end

  resources :lists do 
    resources :ratings
  end

  post 'topic_search', to: 'users#create' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

