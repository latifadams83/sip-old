class JavascriptsController < ApplicationController
  protect_from_forgery except: :dynamic_departments
  def dynamic_departments
    @staff_departments = Department.all
  end
end
