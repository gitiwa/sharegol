Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  resources :courses, only: [:new,:show]
  resources :gones, only: [:create, :destroy]#いらないかも？
  
  resources :wents, only: [:create, :destroy]
  #12/22再度復活
  
  get 'rankings/gone', to: 'rankings#gone'
  
end
