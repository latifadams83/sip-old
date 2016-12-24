Rails.application.routes.draw do

  root "pages#home"
  get "/home", to: "pages#home"

  resources :departments
  resources :categories
  devise_for :users
  resources :guardians

  resources :staffs do
    member do
      get :delete
      get :disable
      post :archive
    end
    collection do
      get :search
      get :search_staff
      post :search_create
    end
  end

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
end
