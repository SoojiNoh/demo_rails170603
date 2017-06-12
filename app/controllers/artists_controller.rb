class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :reject_create, except: [:index, :show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # helper FormHelper
  
  
  # GET /artists
  # GET /artists.json
  def index
    @artist = current_user.artist
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
  end

  # GET /artists/new
  def new

    @artist = Artist.new
    # @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    
    puts "artist_params #{artist_params}"

    respond_to do |format|
      if @artist.save
        format.html { redirect_to edit_artist_path(@artist), notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    
    puts "***************artist_params #{artist_params}"
    
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to edit_artist_path(@artist), notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def artist_params
    #   params.require(:artist).permit(:title, :description)
    # end
    
    def reject_create
      if current_user.artist.present?
        respond_to do |format|
          format.html { redirect_to artists_url, notice: 'Your artist account already exists.' }
        end
      end
    end
    
    def artist_params
      params.require(:artist).permit(:name, :role, contacts_attributes: Contact.attribute_names.map(&:to_sym).push(:_destroy), histories_attributes: History.attribute_names.map(&:to_sym).push(:_destroy))
    end
    
    
end