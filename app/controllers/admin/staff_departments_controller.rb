module Admin
  class StaffDepartmentsController < AdminController
    before_action :set_staff_department, only: [:show, :edit, :update, :destroy]

    def index
      @staff_departments = StaffDepartment.all
    end

    def show
    end

    def new
      @staff_department = StaffDepartment.new
    end

    def edit
    end

    def create
      @staff_department = StaffDepartment.new(staff_department_params)

      respond_to do |format|
        if @staff_department.save
          format.html { redirect_to admin_staff_departments_path, notice: 'Staff department was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @staff_department.update(staff_department_params)
          format.html { redirect_to admin_staff_departments_path, notice: 'Staff department was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @staff_department.destroy
      respond_to do |format|
        format.html { redirect_to admin_staff_departments_url, notice: 'Staff department was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_staff_department
        @staff_department = StaffDepartment.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def staff_department_params
        params.require(:staff_department).permit(:name, :staff_category_id)
      end
  end

end
