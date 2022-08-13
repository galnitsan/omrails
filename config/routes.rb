Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'signin' => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end
  
  get 'feed', to: 'feed#show'
  #get 'users/:username', to: 'users#show', as: 'user'
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items
  resources :tweets do
      resources :comments
  end
  
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact_us' => 'pages#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
