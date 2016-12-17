Rails.application.routes.draw do
  resources :terms
  resources :calendars
  resources :badges
  resources :levels
  resources :programmes
  root "pages#home"
  get "/home", to: "pages#home"
end
