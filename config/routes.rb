Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # get "/products", controller: "products", action: "index"
  get "/products" => "products#index" # Shortcut of above line
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/suppliers" => "suppliers#index"
  post "/suppliers" => "suppliers#create"
  get "/images" => "images#index"

  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"

  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
  get "/carted_products/:id" => "carted_products#show"
  patch "/carted_products/:id" => "carted_products#update"
  delete "/carted_products/:id" => "carted_products#destroy"
end
