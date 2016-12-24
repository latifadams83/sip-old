class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @staff = Staff.new(staff_params)
    if params[:email].present? && params[:password].present? && params[:user_role].present?
      if @user.save
        @user.staffs << @staff
        redirect_to @staff, notice: "Staff Succcessfully Created"
      end
    else
      @staff = Staff.new(staff_params)
      if @staff.save
        redirect_to @staff, notice: "Staff Succcessfully Created"
      else
        render "new"
      end
    end
  end

  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  #View staff member to be archived
  def disable
    @staff = Staff.find(params[:id])
  end

  #Move staff member from staff table to the Archive staff table
  def archive
    @staff = Staff.find(params[:id])
    @arc_staff = ArchiveStaff.new(archive_staff_params(params[:id]))
    if @arc_staff.save
      @staff.destroy
      redirect_to staffs_path, notice: 'Staff Remove Succcessfully'
    end
  end

  def delete
    @staff = Staff.find(params[:id])
  end

  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end


    def staff_params
      params.require(:staff).permit(:staff_id, :date_join, :first_name, :last_name, :gender, :date_of_birth, :qualification, :category_id, :grade, :department_id, :date_of_first_appointment, :marital_status, :spouse_name, :no_of_children, :image, :address, :city, :region, :active, :religion, :user_id)
    end

    def user_params
      params.permit(:email, :password, :user_role)
    end

    def archive_staff_params(id)
      @staff = Staff.find(id)
      return {id: @staff.id, staff_id: @staff.staff_id, date_join: @staff.date_join, first_name: @staff.first_name, last_name: @staff.last_name, gender: @staff.gender, date_of_birth: @staff.date_of_birth, qualification: @staff.qualification, category_id: @staff.category_id, grade: @staff.grade, department_id: @staff.department_id, date_of_first_appointment: @staff.date_of_first_appointment, marital_status: @staff.marital_status, spouse_name: @staff.spouse_name, no_of_children: @staff.no_of_children, image: @staff.image, address: @staff.address, city: @staff.city, region: @staff.region, religion: @staff.religion, user_id: @staff.user_id}
    end

end
