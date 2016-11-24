Rails.application.routes.draw do
  resources :programmes
  root "pages#home"
  get "/home", to: "pages#home"
end
