class FindStudentsController < ApplicationController
  before_action :set_find_student, only: [:show, :edit, :update, :destroy]

  # GET /find_students
  # GET /find_students.json
  def index
    @find_students = FindStudent.all
  end

  # GET /find_students/1
  # GET /find_students/1.json
  def show
  end

  # GET /find_students/new
  def new
    @find_student = FindStudent.new
  end

  # GET /find_students/1/edit
  def edit
  end

  # POST /find_students
  # POST /find_students.json
  def create
    @find_student = FindStudent.new(find_student_params)

    respond_to do |format|
      if @find_student.save
        format.html { redirect_to @find_student, notice: 'Find student was successfully created.' }
        format.json { render :show, status: :created, location: @find_student }
      else
        format.html { render :new }
        format.json { render json: @find_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /find_students/1
  # PATCH/PUT /find_students/1.json
  def update
    respond_to do |format|
      if @find_student.update(find_student_params)
        format.html { redirect_to @find_student, notice: 'Find student was successfully updated.' }
        format.json { render :show, status: :ok, location: @find_student }
      else
        format.html { render :edit }
        format.json { render json: @find_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /find_students/1
  # DELETE /find_students/1.json
  def destroy
    @find_student.destroy
    respond_to do |format|
      format.html { redirect_to find_students_url, notice: 'Find student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_find_student
      @find_student = FindStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def find_student_params
      params.require(:find_student).permit(:first_name, :last_name, :student_id, :programme_id, :level_id, :badge_id, :status)
    end
end
