Rails.application.routes.draw do
  resources :cats do
    collection do
      post 'createMultiple'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
