class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  def index
    @levels = Level.all
  end

  def show
  end

  def new
    @level = Level.new
  end

  def edit
  end

  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to levels_path, notice: 'Level was successfully created.' }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to levels_path, notice: 'Level was successfully updated.' }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:level, :name)
    end
end