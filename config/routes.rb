PeaceCorpsAfrica::Application.routes.draw do

  resources :initiatives do
    match 'home', :to => 'home#index'
  end

  resources :countries do
    collection do
      get :by_code
    end
    match 'home', :to => 'home#index'
  end

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  
  devise_for :users
  
  resources :users, :only => [:show, :index]

end
