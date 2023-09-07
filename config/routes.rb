Rails.application.routes.draw do
  get 'photo_upload/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "buildings#home"
  resources :buildings do
    get 'home', on: :collection
    resources :photos do
      get 'photo_modal'
    end
  end

end
