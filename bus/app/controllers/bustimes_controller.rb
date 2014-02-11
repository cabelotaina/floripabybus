class BustimesController < ApplicationController
  before_action :set_bustime, only: [:show, :edit, :update, :destroy]
  belongs_to :busdayofweeks
  # GET /bustimes
  # GET /bustimes.json
  def index
    @bustimes = Bustime.all
  end

  # GET /bustimes/1
  # GET /bustimes/1.json
  def show
  end

  # GET /bustimes/new
  def new
    @bustime = Bustime.new
  end

  # GET /bustimes/1/edit
  def edit
  end

  # POST /bustimes
  # POST /bustimes.json
  def create
    @bustime = Bustime.new(bustime_params)

    respond_to do |format|
      if @bustime.save
        format.html { redirect_to @bustime, notice: 'Bustime was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bustime }
      else
        format.html { render action: 'new' }
        format.json { render json: @bustime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bustimes/1
  # PATCH/PUT /bustimes/1.json
  def update
    respond_to do |format|
      if @bustime.update(bustime_params)
        format.html { redirect_to @bustime, notice: 'Bustime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bustime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bustimes/1
  # DELETE /bustimes/1.json
  def destroy
    @bustime.destroy
    respond_to do |format|
      format.html { redirect_to bustimes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bustime
      @bustime = Bustime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bustime_params
      params.require(:bustime).permit(:time, :label)
    end
end
