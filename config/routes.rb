MicroBlog::Application.routes.draw do
  scope "(:locale)" do
    ActiveAdmin.routes(self)

    match '/users/auth/:provider/callback' => 'authorizations#create' 
    resources :authorizations, :only => [:index, :create]
    
    devise_for :users
    
    devise_scope :user do
      get "register", :to => "devise/registrations#new", :as => :register_user
      get "sign_in", :to => "devise/sessions#new", :as => :new_user_session
      delete "sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    end
    
    resources :users do
      resources :bleats
    end
    
    resources :bleats
    
    match '/trending/:tag' => 'bleats#trending'  
    match '/home' => 'home#index'
  end
  match ':locale' => 'home#welcome'
  root :to => 'home#welcome'
end
