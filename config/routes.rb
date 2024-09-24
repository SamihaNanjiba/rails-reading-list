Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "books#index"

  resources :books do
    get :archived, on: :collection
    put :archive, on: :member
  end
end
