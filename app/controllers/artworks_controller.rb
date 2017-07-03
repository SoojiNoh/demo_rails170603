class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = Artwork.all
    # @artworks.each do |artwork|
    #   if artwork.image.present?
    #     artwork.image.cache!
    #   end
    # end
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
    # @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
    if @artwork.image.present?
      @artwork.image.cache!
    end
  end

  # POST /artworks
  # POST /artworks.json
  def create
    
    @artwork = current_user.artist.artworks.create(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to :back, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update
    if params[:image].present?
      uploader = ArtworkImgUploader.new
      uploader.store!(params[:image_upload])
      # @artwork.image_url = uploader.url
      # @artwork.thumbnail_url = uploader.thumb.url
    end
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def artwork_params
    #   params.require(:artwork).permit(:title, :description)
    # end
    
    def artwork_params
      params.require(:artwork).permit(:category, :title, :unit, :material, :created_date, :image, :remove_image, :image_cache, size: [])
    end
end