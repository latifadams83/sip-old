Rails.application.routes.draw do

  root "pages#home"

  devise_for :users
  resources :guardians

  scope module: :hr do   #The human resource module
    get "staffs/settings" => "staffs#settings"
    get "staffs/manage" => "staffs#manage"
    resources :staffs do
      member do
        get :delete
        get :confirm_archive
        post :archive
      end
    end
    resources :staff_positions
    resources :staff_grades
    resources :staff_departments
    resources :staff_categories
    resources :searchstaffs
  end  #The human resource module

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
