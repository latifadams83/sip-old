Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'dashboard#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new'
    end
  end
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    get "settings", to: 'settings#index'
    resources :staff_categories, :staff_grades, :staff_positions, :staff_departments, :searchstaffs, :roles, :users, :academic_records
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

    resources :calendars, :terms, :grade_levels, :badges, :houses, :programmes, :search_guardians
    resources :find_students, only: [:new, :create, :show]
    resources :guardians do
      collection do
        get :new_search
        post :create_search
        get :searched_results
      end
    end
    resources :students do
      member do
        get :add_guardian
        post :choose_type
        post :create_guardian
        get :add_parent
        post :create_parent
      end

      collection do
        get :find_guardian
        get :list
      end

    end

  end
end
