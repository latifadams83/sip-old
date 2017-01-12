module Admin
  class StaffsController < ApplicationController
    layout "admin"
    before_action :set_staff, only: [:show, :edit, :update, :destroy]

    def index
      @searchstaff = Searchstaff.new

    end

    def list
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
      @staff = Staff.new(staff_params)
      if @staff.email.present?
        if @staff.save
          generated_password = Devise.friendly_token.first(8)
          user = User.create!(:email => @staff.email, :password => generated_password)
          # RegistrationMailer.welcome(user, generated_password).deliver
          redirect_to admin_staff_path(@staff), notice: "staff created with email: #{generated_password}"
        else
          render "new"
        end
      else
        if @staff.save
          redirect_to admin_staff_path(@staff), notice: "staff created with email: without Email"
        else
          render "new"
        end
      end
    end

    def update
      respond_to do |format|
        if @staff.update(staff_params)
          format.html { redirect_to admin_staff_path( @staff), notice: 'Staff was successfully updated.' }
          format.json { render :show, status: :ok, location: @staff }
        else
          format.html { render :edit }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    end


    #View staff member to be archived
    def confirm_archive
      @staff = Staff.find(params[:id])
    end

    #Move staff member from staff table to the Archive staff table
    def archive
      @staff = Staff.find(params[:id])
      @archive_staff = ArchiveStaff.new(archive_staff_params(params[:id]))
      if @archive_staff.save
        @staff.destroy
        redirect_to admin_staffs_path, notice: 'Staff Archive Succcessfully'
      end
    end

    def delete
      @staff = Staff.find(params[:id])
    end

    def destroy
      @staff.destroy
      respond_to do |format|
        format.html { redirect_to admin_staffs_url, notice: 'Staff was successfully Remove.' }
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
        redirect_to search_results_admin_staffs_path
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

      def archive_staff_params(id)
        @staff = Staff.find(id)
        return {id: @staff.id, staff_id: @staff.staff_id, date_join: @staff.date_join, first_name: @staff.first_name, last_name: @staff.last_name, gender: @staff.gender, date_of_birth: @staff.date_of_birth, qualification: @staff.qualification, staff_category_id: @staff.staff_category_id, staff_grade_id: @staff.staff_grade_id, staff_department_id: @staff.staff_department_id, date_of_first_appointment: @staff.date_of_first_appointment, marital_status: @staff.marital_status, spouse_name: @staff.spouse_name, no_of_children: @staff.no_of_children, image: @staff.image, address: @staff.address, city: @staff.city, region: @staff.region, religion: @staff.religion, user_id: @staff.user_id}
      end

      def user_params(password)
        params.permit(:email, password: password)
      end

      def search_params
        params.require(:searchstaff).permit(:staff_id, :first_name, :last_name, :staff_category_id, :staff_department_id)
      end


  end

end
