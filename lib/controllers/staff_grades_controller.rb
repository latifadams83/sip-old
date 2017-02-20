class StaffGradesController < DashboardController
before_action :set_staff_grade, only: [:show, :edit, :update, :destroy]

def index
  @staff_grades = StaffGrade.all
  @staff_grade = StaffGrade.new
end


def new
  @staff_grade = StaffGrade.new
end

def edit
end

def create
  @staff_grade = StaffGrade.new(staff_grade_params)

  respond_to do |format|
    if @staff_grade.save
      format.html { redirect_to staff_grades_path, notice: 'Staff grade was successfully created.' }
      format.js
    else
      format.html { render :new }
      format.js
    end
  end
end

def update
  respond_to do |format|
    if @staff_grade.update(staff_grade_params)
      format.html { redirect_to staff_grades_path, notice: 'Staff grade was successfully updated.' }
      format.js
    else
      format.html { render :edit }
      format.js
    end
  end
end

def destroy
  @staff_grade.destroy
  respond_to do |format|
    format.html { redirect_to staff_grades_url, notice: 'Staff grade was successfully destroyed.' }
    format.js
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_staff_grade
    @staff_grade = StaffGrade.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def staff_grade_params
    params.require(:staff_grade).permit(:name, :staff_category_id)
  end
end
