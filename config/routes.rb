Rails.application.routes.draw do
  root to: "homepage#index"
  resources :homepage, only: [:index]

  resources :works

  post "/upvote/:id", to: "works#upvote", as: "upvote"

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"
end
