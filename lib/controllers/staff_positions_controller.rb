class StaffPositionsController < DashboardController
  before_action :set_staff_position, only: [:edit, :update, :destroy]

  def index
    @staff_positions = StaffPosition.all
    @staff_position = StaffPosition.new
  end

  def show
  end

  def new
    @staff_position = StaffPosition.new
  end

  def edit
  end

  def create
    @staff_position = StaffPosition.new(staff_position_params)

    respond_to do |format|
      if @staff_position.save
        format.html { redirect_to staff_positions_path, notice: 'Staff position was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @staff_position.update(staff_position_params)
        format.html { redirect_to staff_positions_path, notice: 'Staff position was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @staff_position.destroy
    respond_to do |format|
      format.html { redirect_to staff_positions_url, notice: 'Staff position was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_position
      @staff_position = StaffPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_position_params
      params.require(:staff_position).permit(:name, :staff_category_id)
    end
end
