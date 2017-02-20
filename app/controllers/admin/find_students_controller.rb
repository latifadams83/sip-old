module Admin

  class FindStudentsController < AdminController
    before_action :set_find_student, only: [:show]

    def new
      @find_student = FindStudent.new
      @programmes = Programme.all
      @levels = GradeLevel.all
      @badges = Badge.all
    end

    def show
    end

    def create
      @find_student = FindStudent.new(find_student_params)

      respond_to do |format|
        if @find_student.save
          format.html { redirect_to admin_find_student_path(@find_student) }
        else
          format.html { render :new }
        end
      end
    end


    private
      def set_find_student
        @find_student = FindStudent.find(params[:id])
      end

      def find_student_params
        params.require(:find_student).permit(:first_name, :last_name, :student_id, :programme_id, :level_id, :badge_id, :status)
      end
  end


end
