class StudentsController < DashboardController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    @programmes = Programme.all
    @levels = Level.all
    @badges = Badge.all
  end

  def search
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
    role = Role.where({:name => "student"}).first.id.to_i
    if @student.email.present? && role.present?
      generated_password = Devise.friendly_token.first(8)
      @user = User.new(:email => @student.email, :password => generated_password, :role_id => role)
      @user.students << @student
      if @user.save
        UserMailer.welcome_msg(@user, generated_password).deliver
        redirect_to add_guardian_student_path(@student), notice: "Add Guardian Details, Password: #{generated_password}"
      else
        render "new"
      end
    else
      if @student.save
        redirect_to add_guardian_student_path(@student), notice: "Add Guardian Details"
      else
        render "new"
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_path(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: student_path(@student) }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def guardian_type
  end

  def choose_type
    if params[:choose] == "new"
      redirect_to add_guardian_admin_student_path
    else
      redirect_to admin_students_path
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
      redirect_to student_path(@student), notice: "Student successfully placed"
    else
      render "new_guardian"
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
      params.require(:student).permit(:placed_id, :placed_date, :first_name, :last_name, :gender, :date_of_birth, :religion, :programme_id, :level_id, :badge_id, :house_id, :address, :city, :region, :phone, :email, :guardian_id, :user_id, :image)
    end

    def guardian_params
      params.require(:guardian).permit(:title, :first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education, :user_id)
    end
end
