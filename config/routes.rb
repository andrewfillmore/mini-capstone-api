Rails.application.routes.draw do
  get "/products", controller: "products", action: "index"

  post "/products", controller: "products", action: "create"

  get "/products/:id", controller: "products", action: "show"

  patch "/products/:id", controller: "products", action: "update"

  delete "/products/:id", controller: "products", action: "destroy"

end
