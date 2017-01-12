class AcademicRecordsController < ApplicationController
  layout "admin"
  before_action :set_academic_record, only: [:show, :edit, :update, :destroy]

  def index
    @academic_records = AcademicRecord.all
  end

  def show
  end

  def new
    @academic_record = AcademicRecord.new
  end

  def edit
  end

  def create
    @academic_record = AcademicRecord.new(academic_record_params)

    respond_to do |format|
      if @academic_record.save
        format.html { redirect_to @academic_record, notice: 'Academic record was successfully created.' }
        format.json { render :show, status: :created, location: @academic_record }
      else
        format.html { render :new }
        format.json { render json: @academic_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @academic_record.update(academic_record_params)
        format.html { redirect_to @academic_record, notice: 'Academic record was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_record }
      else
        format.html { render :edit }
        format.json { render json: @academic_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @academic_record.destroy
    respond_to do |format|
      format.html { redirect_to academic_records_url, notice: 'Academic record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_academic_record
      @academic_record = AcademicRecord.find(params[:id])
    end

    def academic_record_params
      params.require(:academic_record).permit(:type, :cert_earned, :institution, :duration)
    end
end
