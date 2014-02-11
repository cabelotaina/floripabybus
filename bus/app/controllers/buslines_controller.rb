class BuslinesController < ApplicationController
  before_action :set_busline, only: [:show, :edit, :update, :destroy]
  has_many :busdayofweeks
  # GET /buslines
  # GET /buslines.json
  def index
    @buslines = Busline.all
  end

  # GET /buslines/1
  # GET /buslines/1.json
  def show
  end

  # GET /buslines/new
  def new
    @busline = Busline.new
  end

  # GET /buslines/1/edit
  def edit
  end

  # POST /buslines
  # POST /buslines.json
  def create
    @busline = Busline.new(busline_params)

    respond_to do |format|
      if @busline.save
        format.html { redirect_to @busline, notice: 'Busline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @busline }
      else
        format.html { render action: 'new' }
        format.json { render json: @busline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buslines/1
  # PATCH/PUT /buslines/1.json
  def update
    respond_to do |format|
      if @busline.update(busline_params)
        format.html { redirect_to @busline, notice: 'Busline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @busline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buslines/1
  # DELETE /buslines/1.json
  def destroy
    @busline.destroy
    respond_to do |format|
      format.html { redirect_to buslines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busline
      @busline = Busline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busline_params
      params.require(:busline).permit(:number, :line, :company, :card_price, :money_price, :time_to_go, :time_to_back, :busdayofweek_id)
    end
end
