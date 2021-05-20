Rails.application.routes.draw do
  # PRODUCTS
  get "/products", controller: "products", action: "index"

  post "/products", controller: "products", action: "create"

  get "/products/:id", controller: "products", action: "show"

  patch "/products/:id", controller: "products", action: "update"

  delete "/products/:id", controller: "products", action: "destroy"

  # SUPPLIERS

  get "/suppliers", controller: "suppliers", action: "index"

  # Users
  post "/users" => "users#create"
end
