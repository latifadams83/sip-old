  class ProgrammesController < DashboardController
    before_action :set_programme, only: [:edit, :update, :destroy]

    def index
      @programmes = Programme.all
      @programme = Programme.new
    end

    def new
      @programme = Programme.new
    end

    def edit
    end

    def create
      @programme = Programme.new(programme_params)

      respond_to do |format|
        if @programme.save
          format.html { redirect_to programmes_path, notice: 'Programme was successfully created.' }
          format.js
        else
          format.html { render :new }
          format.js
        end
      end
    end

    def update
      respond_to do |format|
        if @programme.update(programme_params)
          format.html { redirect_to programmes_path, notice: 'Programme was successfully updated.' }
          format.json { render :show, status: :ok, location: @programme }
          format.js
        else
          format.html { render :edit }
          format.json { render json: @programme.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

    def destroy
      @programme.destroy
      respond_to do |format|
        format.html { redirect_to programmes_url, notice: 'Programme was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_programme
        @programme = Programme.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def programme_params
        params.require(:programme).permit(:name, :code)
      end
  end
