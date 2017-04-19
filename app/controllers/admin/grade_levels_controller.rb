module Admin
  class GradeLevelsController < AdminController
    before_action :set_level, only: [:edit, :update, :destroy]

    def index
      @grade_levels = GradeLevel.all
      @grade_level = GradeLevel.new
    end

    def show
    end

    def new
      @grade_level = GradeLevel.new
    end

    def edit
    end

    def create
      @grade_level = GradeLevel.new(level_params)

      respond_to do |format|
        if @grade_level.save
          format.html { redirect_to admin_grade_levels_path, notice: 'Grade Level was successfully created.' }
          format.js
        else
          format.html { render :new }
          format.js
        end
      end
    end

    def update
      respond_to do |format|
        if @grade_level.update(level_params)
          format.html { redirect_to admin_grade_levels_path, notice: 'GradeLevel was successfully updated.' }
          format.js
        else
          format.html { render :edit }
          format.js
        end
      end
    end

    def destroy
      @grade_level.destroy
      respond_to do |format|
        format.html { redirect_to admin_grade_levels_path, notice: 'GradeLevel was successfully destroyed.' }
        format.js
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_level
        @grade_level = GradeLevel.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def level_params
        params.require(:grade_level).permit(:level, :name, :next_level)
      end
  end

end
