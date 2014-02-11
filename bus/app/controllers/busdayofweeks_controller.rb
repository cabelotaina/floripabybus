class BusdayofweeksController < ApplicationController
  before_action :set_busdayofweek, only: [:show, :edit, :update, :destroy]
  belongs_to :busline
  has_many :bustimes

  # GET /busdayofweeks
  # GET /busdayofweeks.json
  def index
    @busdayofweeks = Busdayofweek.all
  end

  # GET /busdayofweeks/1
  # GET /busdayofweeks/1.json
  def show
  end

  # GET /busdayofweeks/new
  def new
    @busdayofweek = Busdayofweek.new
  end

  # GET /busdayofweeks/1/edit
  def edit
  end

  # POST /busdayofweeks
  # POST /busdayofweeks.json
  def create
    @busdayofweek = Busdayofweek.new(busdayofweek_params)

    respond_to do |format|
      if @busdayofweek.save
        format.html { redirect_to @busdayofweek, notice: 'Busdayofweek was successfully created.' }
        format.json { render action: 'show', status: :created, location: @busdayofweek }
      else
        format.html { render action: 'new' }
        format.json { render json: @busdayofweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busdayofweeks/1
  # PATCH/PUT /busdayofweeks/1.json
  def update
    respond_to do |format|
      if @busdayofweek.update(busdayofweek_params)
        format.html { redirect_to @busdayofweek, notice: 'Busdayofweek was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @busdayofweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busdayofweeks/1
  # DELETE /busdayofweeks/1.json
  def destroy
    @busdayofweek.destroy
    respond_to do |format|
      format.html { redirect_to busdayofweeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busdayofweek
      @busdayofweek = Busdayofweek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busdayofweek_params
      params.require(:busdayofweek).permit(:day, :direction, :bustime_id)
    end
end
