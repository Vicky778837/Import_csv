Rails.application.routes.draw do
  #get 'products/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do
    collection { post :import }
  end

  root 'products#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
