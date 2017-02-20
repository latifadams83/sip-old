module Admin
  class StudentsController < AdminController
    before_action :set_student, only: [:show, :edit, :update, :destroy, :create_guardian]

    def index
      @programmes = Programme.all
      @badges = Badge.all
      @levels = GradeLevel.all
      if params[:p].present? && params[:l].present? && params[:b].present?
        @students = Student.where("programme_id = ? AND grade_level_id = ? AND badge_id = ?", params[:p], params[:l], params[:b])
      elsif params[:p].present? && params[:l].present?
        @students = Student.where("programme_id = ? AND grade_level_id = ?", params[:p], params[:l])
      elsif params[:p].present?
        @students = Student.where("programme_id = ?", params[:p])
      else
        @students = nil
      end
    end

    def list
      @students = Student.order(:placed_id).where("placed_id LIKE ?", "%#{params[:term]}%")
      render json: @students.map(&:placed_id)
    end

    def show
    end

    def new
      @student = Student.new
    end

    def edit
    end

    def create
      @student = Student.new(student_params)
      respond_to do |format|
        if @student.save

          format.html {redirect_to add_guardian_admin_student_path(@student),  notice: "Student Saved Successfully. Please Add Parent and Guardian Details." }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to admin_student_path(@student), notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_student_path(@student) }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @student.destroy
      respond_to do |format|
        format.html { redirect_to admin_students_url, notice: 'Student was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def add_guardian
      @guardian = Guardian.new
    end

  def create_guardian
    @guardian = Guardian.new(guardian_params)
    if @guardian.save
      @guardian.student = @student
      redirect_to admin_student_path, notice: "Student Placed Successfully"
    else
      render "add_guardian"
    end
  end

    #Searching student resources
    def search_create
    end

    def search_results
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def student_params
        params.require(:student).permit(:placed_id, :placed_date, :first_name, :last_name, :gender, :date_of_birth, :religion, :programme_id, :grade_level_id, :badge_id, :house_id, :address, :city, :region, :phone, :email, :guardian_id, :user_id, :image)
      end

      def guardian_params
        params.require(:guardian).permit(:first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education, :father_name, :father_occupation, :father_hometown, :father_homeregion, :mother_name, :mother_occupation, :mother_hometown, :mother_homeregion, :user_id)
      end

  end

end
