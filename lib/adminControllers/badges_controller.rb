module Admin
  class BadgesController < ApplicationController
    layout "admin"
    before_action :set_badge, only: [:edit, :update, :destroy]

    def index
      @badges = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def edit
    end

    def create
      @badge = Badge.new(badge_params)

      respond_to do |format|
        if @badge.save
          format.html { redirect_to admin_badges_path, notice: 'New class successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @badge.update(badge_params)
          format.html { redirect_to admin_badges_path, notice: 'Class successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @badge.destroy
      respond_to do |format|
        format.html { redirect_to admin_badges_url, notice: 'Class successfully deleted.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_badge
        @badge = Badge.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def badge_params
        params.require(:badge).permit(:name, :programme_id, :level_id, :start_date, :end_date, :active)
      end
  end

end
