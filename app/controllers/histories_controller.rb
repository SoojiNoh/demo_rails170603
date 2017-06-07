class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = Exhibition.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = Exhibition.new
    # @history = Exhibition.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = Exhibition.new(history_params)
    # @history = Exhibition.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to :back, notice: 'Exhibition was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_via_catalogue
    @history = Exhibition.new(history_params)
    # @history = Exhibition.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to '/', notice: 'Exhibition was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'Exhibition was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'Exhibition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = Exhibition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def history_params
    #   params.require(:history).permit(:title, :description)
    # end
    
    def history_params
      params.require(:history).permit(:category, :title, :start_date, :end_date)
    end
end
