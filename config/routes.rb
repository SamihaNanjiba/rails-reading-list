Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "books#index"

  resources :books
end
