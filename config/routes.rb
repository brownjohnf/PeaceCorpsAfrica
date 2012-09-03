PeaceCorpsAfrica::Application.routes.draw do

  resources :initiatives do
  end

  resources :countries do
    collection do
      get :by_code
    end
  end

  namespace :country, :path => '/:country_code' do
    resources :initiatives
    get '/' => 'home#index', :as => :home
  end

  namespace :initiative, :path => '/:abbreviation' do
    get '/' => 'home#index', :as => :home
  end

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  
  devise_for :users
  
  resources :users, :only => [:show, :index]

end
