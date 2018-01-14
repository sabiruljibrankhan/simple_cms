Rails.application.routes.draw do


  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  resources :sessions

  get "sign_up" => "users#new", :as => "sign_up"
  # root :to => "users#new"
  resources :users

  get "change_password" => "users#change_password", as: "change_password"
  post "reset_password" => "users#reset_password", as: "reset_password"

  root "demo#index"

  resources :subjects do

    member do
      get :delete
    end
  end

  resources :pages do

    member do
      get :delete
    end
  end

  resources :sections do

    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  #default routes
  #may go away in future versions of Rails
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
