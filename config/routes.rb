Rails.application.routes.draw do
  resources :records
  # resources :users
  
  get "/users/:id", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
end
