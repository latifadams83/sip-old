Rails.application.routes.draw do

  root "pages#home"

  devise_for :users
  resources :guardians

  namespace :admin do
    resources :staff_categories, :staff_grades, :staff_positions, :staff_departments, :searchstaffs
    resources :staffs do
      member do
        get :delete
        get :confirm_archive
        post :archive
      end

      collection do
        get :list
        get :search
        post :search_create
        get :search_results
      end
    end

    resources :calendars, :terms, :levels, :badges, :programmes
    resources :students do
      member do
        get :guardians
        get :new_guardian
        put :update_guardian
        post :add_guardian
        delete :remove_guardian
      end
    end

  end


end
