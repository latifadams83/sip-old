module Admin
  class GradeLevelsController < AdminController
    before_action :set_level, only: [:edit, :update, :destroy]

    def index
      @levels = GradeLevel.all
    end

    def show
    end

    def new
      @level = GradeLevel.new
    end

    def edit
    end

    def create
      @level = GradeLevel.new(level_params)

      respond_to do |format|
        if @level.save
          format.html { redirect_to admin_grade_levels_path, notice: 'Grade Level was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @level.update(level_params)
          format.html { redirect_to admin_grade_levels_path, notice: 'GradeLevel was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @level.destroy
      respond_to do |format|
        format.html { redirect_to admin_grade_levels_path, notice: 'GradeLevel was successfully destroyed.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_level
        @level = GradeLevel.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def level_params
        params.require(:grade_level).permit(:level, :name)
      end
  end

end
