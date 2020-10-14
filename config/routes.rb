Rails.application.routes.draw do
  resources :posts
  resources :items
  resources :users

  post '/dashboard/:id', to: "items#dashboard"
 
  post "/register", to: "users#create"
  post "/login", to: "auth#login"
  get "/autologin", to: "auth#autologin"
  post "/logout", to: "auth#logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
