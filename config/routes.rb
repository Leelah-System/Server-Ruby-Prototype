LeelahSystemServer::Application.routes.draw do


  # Admin part => "/admin/..."
  namespace :admin do

    root :to => "dashboard#index"

    # routes for login and logout to admin part
    get "login" => "session#login"
    get "logout" => "session#logout"
    match "authenticate" => "session#authenticate", :via => :post

    # route for Dashboard
    get "dashboard/index"

    # routes for General Configuration
    namespace :general_configuration do

      root :to => "users#index"

      # routes for Users
      resources :users

      # routes for Company
      get "company" => "company#index"
      get "company/edit"
      match "company/update" => "company#update", :via => :put

    end

    namespace :catalog_management do
      root :to => "products#index"

      resources :products

      root :to => "categories#index"

      resources :categories 
    end

    namespace :order_management do
      root :to => "orders#index"

      resources :orders
    end

    root :to => "reports#index"
    resources :reports

  end

  # API part => /api/...
  namespace :api, :defaults => {:format => "json"} do

    match "authenticate" => "user#authenticate", :via => :post
    match "sign_up" => "user#sign_up", :via => :post

    # with token
    scope "/:token" do
      match "users" => "user#all"

      match "product/:category_id" => 'product#category', :product => 'category'

      resources :product, :only => [:index, :show, :create, :update, :destroy]

      resources :catalog, :only => [:index, :show]

      resources :order, :only => [:index, :show, :create]

      resources :order_status, :only => [:index, :show, :create, :update, :destroy]

      resources :category, :only => [:index, :show, :create, :update, :destroy]

      
    end

  end

  root :to => "admin/dashboard#index"

end
