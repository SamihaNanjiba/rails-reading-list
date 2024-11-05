Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books do
        get :archived, on: :collection
        put :archive, on: :member
        put :unarchive, on: :member
      end
    end
  end
  # Defines the root path route ("/")
  root "books#index"
  get "/publications", to: redirect("/books")

  resources :books do
    get :archived, on: :collection
    put :archive, on: :member
    put :unarchive, on: :member
  end
end
