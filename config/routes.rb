Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'signin' => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end

  
  get '/tweets/search', to: 'tweets#search', as: :search
  
  get 'feed', to: 'feed#show'
  #get 'users/:username', to: 'users#show', as: 'user'
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end

  

  resources :tweets do
      resources :comments
  end
  
  resources :tweet_searches
  
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact_us' => 'pages#contact_us'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
