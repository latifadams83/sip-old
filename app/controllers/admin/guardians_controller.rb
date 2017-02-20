module Admin
  class GuardiansController < AdminController
    before_action :set_guardian, only: [:show, :edit, :update, :destroy]

    def index
      @guardians = Guardian.order(:first_name)
      @guardians = @guardians.where("name like ?", "%#{params[:ward_id]}%") if params[:ward_id]
       respond_to do |format|
         format.html
         format.js
      end
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
          format.html { redirect_to admin_guardian_path(@guardian), notice: 'Guardian was successfully updated.' }
        else
          format.html { render :edit, notice: "Guardian could not be updated" }
        end
      end
    end

    def destroy
      @guardian.destroy
      respond_to do |format|
        format.html { redirect_to admin_guardians_url, notice: 'Guardian was successfully destroyed.' }
      end
    end

    #Search Guardians
    def new_search
      @searchguardian = SearchGuardian.new
    end

    def create_search
      @searchguardian = SearchGuardian.new(search_params)
      if @searchguardian.save
        redirect_to searched_results_admin_guardians_path
      end
    end

    def searched_results
      @searchguardian = SearchGuardian.last
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_guardian
        @guardian = Guardian.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def guardian_params
        params.require(:guardian).permit(:title, :first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education, :ward_id)
      end

      def search_params
        params.require(:search_guardian).permit(:first_name, :last_name, :phone, :email, :ward_id)
      end
  end

end
