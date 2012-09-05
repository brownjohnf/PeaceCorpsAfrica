PeaceCorpsAfrica::Application.routes.draw do

  resources :initiatives

  resources :countries

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  
  devise_for :users
  
  resources :users, :only => [:show, :index]

  namespace :country, :path => '/:country_code', :constraints => { :country_code => /[A-Za-z]{2}/ } do
    resources :initiatives
    get '/' => 'home#index', :as => :home
  end

  namespace :initiative, :path => '/:abbreviation' do
    get '/' => 'home#index', :as => :home
  end

end
