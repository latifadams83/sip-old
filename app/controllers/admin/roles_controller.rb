module Admin
  class RolesController < AdminController

    def index
      @roles = Role.all
    end

    def new
      @role = Role.new
    end

    def create
      @role = Role.new(role_params)

      respond_to do |format|
        if @role.save
          format.html { redirect_to admin_roles_url, notice: 'Role was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def destroy
      @role = Role.find(params[:id])
      @role.destroy
      respond_to do |format|
        format.html { redirect_to admin_roles_url, notice: 'Role was successfully destroyed.' }
      end
    end

    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def role_params
        params.require(:role).permit(:name)
      end
  end


end
