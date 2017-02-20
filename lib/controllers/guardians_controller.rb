  class GuardiansController < AdminController
    before_action :set_guardian, only: [:show, :edit, :update, :destroy]

    def index
      @guardians = Guardian.all
    end

    def show
    end

    def new
      @guardian = Guardian.new
    end

    def edit
    end

    def update
      respond_to do |format|
        if @guardian.update(guardian_params)
          format.html { redirect_to guardian_path(@guardian), notice: 'Guardian was successfully updated.' }
        else
          format.html { render :edit, notice: "Guardian could not be updated" }
        end
      end
    end

    def destroy
      @guardian.destroy
      respond_to do |format|
        format.html { redirect_to guardians_url, notice: 'Guardian was successfully destroyed.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_guardian
        @guardian = Guardian.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def guardian_params
        params.require(:guardian).permit(:title, :first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education)
      end
  end
