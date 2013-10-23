Cms::Application.routes.draw do
  get "contact" => "contact#index", :as => "contact"
  get "about" => "about#index", :as => "about"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions
  get "admin" => "admin#index", :as => "admin"
  #resources :admin
  resources :users do
  	resources :notes
  end
  
  resources :jobs do
  	resources :invoices
    resources :contracts
    resources :estimates
  end

  resources :clients

  resources :supplies

  root 'welcome#index'

end
