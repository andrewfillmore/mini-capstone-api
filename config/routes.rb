Rails.application.routes.draw do
  get "/all_product_path", controller: "products", action: "all_product_method"
  get "/first_product_path", controller: "products", action: "first_product_method"
end
