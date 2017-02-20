module Admin
  class SearchGuardiansController < AdminController
    before_action :set_search_guardian, only: [:show, :edit, :update, :destroy]

    # GET /search_guardians
    # GET /search_guardians.json
    def index
      @search_guardians = SearchGuardian.all
    end

    # GET /search_guardians/1
    # GET /search_guardians/1.json
    def show
    end

    # GET /search_guardians/new
    def new
      @search_guardian = SearchGuardian.new
    end

    # GET /search_guardians/1/edit
    def edit
    end

    # POST /search_guardians
    # POST /search_guardians.json
    def create
      @search_guardian = SearchGuardian.new(search_guardian_params)

      respond_to do |format|
        if @search_guardian.save
          format.html { redirect_to admin_search_guardian_path(@search_guardian), notice: 'Search guardian was successfully created.' }
          format.json { render :show, status: :created, location: @search_guardian }
        else
          format.html { render :new }
          format.json { render json: @search_guardian.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /search_guardians/1
    # PATCH/PUT /search_guardians/1.json
    def update
      respond_to do |format|
        if @search_guardian.update(search_guardian_params)
          format.html { redirect_to admin_search_guardian_path(@search_guardian), notice: 'Search guardian was successfully updated.' }
          format.json { render :show, status: :ok, location: @search_guardian }
        else
          format.html { render :edit }
          format.json { render json: @search_guardian.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /search_guardians/1
    # DELETE /search_guardians/1.json
    def destroy
      @search_guardian.destroy
      respond_to do |format|
        format.html { redirect_to search_guardians_path, notice: 'Search guardian was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_search_guardian
        @search_guardian = SearchGuardian.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def search_guardian_params
        params.require(:search_guardian).permit(:first_name, :last_name, :phone, :email, :ward_id)
      end
  end


end
