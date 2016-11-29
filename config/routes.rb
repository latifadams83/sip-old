Rails.application.routes.draw do
  resources :badges
  resources :programmes
  root "pages#home"
  get "/home", to: "pages#home"
end
