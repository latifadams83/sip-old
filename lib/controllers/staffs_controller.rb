class StaffsController < DashboardController
  before_action :set_staff, only: [:show, :edit, :update, :confirm_archive, :archive, :delete, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @staffs = Staff.search(params[:k]).order(sort_column+" "+sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    role = Role.where({:name => "staff"}).first.id.to_i
    if @staff.email.present? && role.present?
      generated_password = Devise.friendly_token.first(8)
      @user = User.new(:email => @staff.email, :password => generated_password, :role_id => role)
      @user.staffs << @staff
      if @user.save
        UserMailer.welcome_msg(@user, generated_password).deliver
        redirect_to staff_path(@staff), notice: "staff created with Password: #{generated_password}"
      else
        render "new"
      end
    else
      if @staff.save
        redirect_to staff_path(@staff), notice: "staff created with email: without Email"
      else
        render "new"
      end
    end
  end

  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staff_path( @staff), notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  #View staff member to be archived
  def confirm_archive
  end

  def archive
    if @staff.update(staff_params)
      if @staff.user.present?
        @staff.user.destroy
        redirect_to staff_path(@staff), notice: 'Staff Archive Succcessfully'
      else
        redirect_to staff_path(@staff), notice: 'Staff Archive Succcessfully'
      end
    end
  end

  def delete
  end

  def destroy
    @staff.destroy
    if @staff.user.present?
      @staff.user.destroy
    end
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully Remove.' }
      format.json { head :no_content }
    end
  end

  def settings
  end

  #Searching staff members
  def search
    @searchstaff = Searchstaff.new
  end

  def search_create
    @searchstaff = Searchstaff.new(search_params)
    if @searchstaff.save
      redirect_to search_results_staffs_path
    end
  end

  def search_results
    @searchstaff = Searchstaff.last
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:staff_id, :date_join, :first_name, :last_name, :gender, :date_of_birth, :staff_category_id, :staff_grade_id, :staff_department_id, :staff_position_id, :date_of_first_appointment, :marital_status, :spouse_name, :no_of_children, :image, :address, :city, :region, :phone, :mobile, :status, :religion, :user_id, :qualification, :email)
    end

    def search_params
      params.require(:searchstaff).permit(:staff_id, :first_name, :last_name, :staff_category_id, :staff_department_id)
    end

    def sort_column
      Staff.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
