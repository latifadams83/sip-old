module Admin
  class StudentsController < ApplicationController
    layout "admin"
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
      @students = Student.all
    end

    def list
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

          format.html {redirect_to add_guardian_admin_student_path(@student),  notice: "Student Record Saved Successfully. Please fill the Parent Details." }
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
        @student = Student.find(params[:id])
        @guardian.students << @student
        redirect_to admin_student_path(@student), notice: "Student successfully placed"
      else
        render "add_guardian"
      end
    end

    #Searching student resources
    def search
    end

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
        params.require(:student).permit(:placed_id, :placed_date, :first_name, :last_name, :gender, :date_of_birth, :religion, :programme_id, :level_id, :badge_id, :address, :city, :region, :phone, :email, :guardian_id, :user_id, :image)
      end

      def guardian_params
        params.require(:guardian).permit(:title, :first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education, :user_id)
      end
  end

end
