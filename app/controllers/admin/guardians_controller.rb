module Admin
  class GuardiansController < ApplicationController
    layout "admin"
    before_action :set_guardian, only: [:show, :edit, :update, :destroy]

    def index
      @guardians = Guardian.all
    end

    def show
    end

    def new
      @student = Student.last

      @guardian = Guardian.new
    end

    def edit
    end

    def create
      @guardian = Guardian.new(guardian_params)

      respond_to do |format|
        if @guardian.save
          format.html { redirect_to @guardian, notice: 'Guardian was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @guardian.update(guardian_params)
          format.html { redirect_to @guardian, notice: 'Guardian was successfully updated.' }
        else
          format.html { render :edit }
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
        params.require(:guardian).permit(:title, :first_name, :last_name, :occupation, :relation, :address, :city, :region, :phone, :email, :education, :user_id)
      end
  end

end
