class DashboardController < ApplicationController

  def index
    if current_user.present?
      if current_user.role.name == 'super'
        redirect_to admin_path
      else
        redirect_to root_path
      end
    end
  end
  
end
