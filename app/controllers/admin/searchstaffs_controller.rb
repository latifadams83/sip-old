module Admin
  class SearchstaffsController < AdminController
    def new
      @searchstaff = Searchstaff.new
    end

    def create
      @searchstaff = Searchstaff.create(search_params)
      redirect_to @searchstaff
    end

    def show
      @searchstaff = Searchstaff.find(params[:id])
    end


    private

    def search_params
      params.require(:searchstaff).permit(:staff_id, :first_name, :last_name, :category_id, :department_id)
    end
  end

end
