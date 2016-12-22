Rails.application.routes.draw do
  resources :staffs
  devise_for :users
  resources :guardians

  resources :students do
    member do
      get :guardians
      get :new_guardian
      put :update_guardian
      post :add_guardian
      delete :remove_guardian
    end
  end
  resources :terms
  resources :calendars
  resources :badges
  resources :levels
  resources :programmes
  root "pages#home"
  get "/home", to: "pages#home"
end
