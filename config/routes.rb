PeaceCorpsAfrica::Application.routes.draw do

  resources :countries

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  
  devise_for :users
  
  resources :users, :only => [:show, :index]

end
