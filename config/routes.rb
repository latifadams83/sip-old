Rails.application.routes.draw do

  root "pages#home"

  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :academic_records
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


end
