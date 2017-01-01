module Hr
  class StaffCategoriesController < ApplicationController
    before_action :set_staff_category, only: [:edit, :update, :destroy]

    def index
      @staff_categories = StaffCategory.all
    end

    def new
      @staff_category = StaffCategory.new
    end

    def edit
    end

    def create
      @staff_category = StaffCategory.new(staff_category_params)

      respond_to do |format|
        if @staff_category.save
          format.html { redirect_to staff_categories_path, notice: 'Staff category was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @staff_category.update(staff_category_params)
          format.html { redirect_to staff_categories_path, notice: 'Staff category was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @staff_category.destroy
      respond_to do |format|
        format.html { redirect_to staff_categories_url, notice: 'Staff category was successfully destroyed.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_staff_category
        @staff_category = StaffCategory.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def staff_category_params
        params.require(:staff_category).permit(:name)
      end
  end

end
