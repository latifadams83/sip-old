Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'staffs#index'
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
        get :list
        get :search
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
        get :list
        get :search
        post :search_create
        get :search_results
      end

    end


end
