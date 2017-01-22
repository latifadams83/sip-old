Rails.application.routes.draw do

  resources :models
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'students#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new'
    end
  end
  resources :academic_records

    resources :staff_categories, :staff_grades, :staff_positions, :staff_departments, :searchstaffs, :roles, :users
    resources :staffs do
      member do
        get :delete
        get :confirm_archive
        patch :archive
      end

      collection do
        get :search
        get :list
        post :search_create
        get :search_results
      end
    end

    resources :calendars, :terms, :levels, :badges, :programmes, :guardians
    resources :students do
      member do
        get :add_guardian
        post :create_guardian
      end

      collection do
        get :search
      end

    end


end
