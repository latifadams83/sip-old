class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
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
    # unless params[:foo].present?
    if params[:email].present? && params[:password].present? && params[:user_role].present?
      @user = User.new(user_params)
      if @user.save
        @staff = Staff.new(staff_params)
        @user.staffs
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
      params.require(:staff).permit(:staff_id, :date_join, :first_name, :gender, :date_of_birth, :qualification, :specialization, :grade, :job_description, :date_of_first_appointment, :marital_status, :spouse_name, :no_of_children, :image, :address, :city, :region, :active, :religion, :user_id)
    end

    def user_params
      params.require(:user).permit(:email, :password, :user_role)
    end
end
