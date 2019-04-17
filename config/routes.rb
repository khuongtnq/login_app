Rails.application.routes.draw do
  get 'home/ping'
  get 'home/pong'
  get 'home/index'
  resources :robots
  get 'books/index'
  get 'books/new'
  use_doorkeeper do
  	skip_controllers :applications, :authorized_applications
  end
  
  namespace :api do
  	post "login"  => "session#create"
    delete "logout" => "session#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get     "login"    => "session#new"
  post    "login"    => "session#create"
  delete  "logout"   => "session#destroy"
  resources :users do
    collection {post :import}
  end
  resources :books
  resources :account_activations, only: [:edit]
end
