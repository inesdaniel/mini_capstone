Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    post "/users" => "users#create"
    
    post "/sessions" => "sessions#create"

    get "/orders/:id" => "orders#show"
    post "/orders" => "orders#create"

    post "/carted_products" => "carted_products#create"
  end
end
