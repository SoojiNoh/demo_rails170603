class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_artwork, only: [:new, :create, :update]
  before_filter :authenticate_user!

  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = current_user.artist.artworks.all
    # if @parent_object.present?
    #   puts @parent_object.inspect
    #   if @parent_object.artworks.present?
    #     @artworks = @parent_object.artworks.all
    #   end
    # end
    #   @artwork = @parent_object.artworks.new
    # if @artwork.image.present?
    #   @artwork.image.cache!
    # end
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/new
  def new
    if @parent_object.present?
        @artworks = @parent_object.artworks.all
        @artwork = @parent_object.artworks.new
    else
      @artworks = current_user.artist.artworks.all
      @artwork = current_user.artist.artworks.new
    end
    
    # if @artwork.image.present?
    #   @artwork.image.cache!
    # end
  end

  # GET /artworks/1/edit
  def edit

  end

  # POST /artworks
  # POST /artworks.json
  def create
  puts params.inspect
  puts params[:model_name]
   
    if @parent_object.present?
      puts "parent artwork successfully created"
      @artwork = @parent_object.artworks.create(artwork_params)
    else
      puts "artist artwork successfully created"
      @artwork = current_user.artist.artworks.create(artwork_params)
    end
    
    # @artwork = Artwork.create(artwork_params)

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
    
    respond_to do |format|
      if @artwork.update(artwork_params)
        if @parent_object.class.name.present?
          format.html { redirect_to :back, notice: 'Artwork was successfully updated.' }
          format.json { render :show, status: :ok, location: @artwork }
        else
          format.html { redirect_to :back, notice: 'Artwork was successfully updated.' }
          format.json { render json: @artwork.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end
    
    def set_parent_artwork
      if params[:model_name].present?
        puts "params[:model_name] is set " + params[:model_name]
        parent_class = params[:model_name].constantize
        parent_foreign_key = params[:model_name].foreign_key
        @parent_object = parent_class.find(params[parent_foreign_key])
      else
        puts "params[:model_name] is nil"
      end
    end
    
    def set_catalogue
      if params[:catalogue_id].to_i.nil?
        puts "params[:catalogue_id] is nil"
        @catalogue = nil

      else
        puts "params[:catalogue_id] is set"
        @catalogue = Catalogue.find(params[:catalogue_id].to_i)
        puts @catalogue.inspect
        # params.fetch(@catalogue)
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def artwork_params
    #   params.require(:artwork).permit(:title, :description)
    # end
    
    def artwork_params
      params.require(:artwork).permit(:category, :title, :unit, :material, :created_date, :image, :remove_image, :image_cache, size: [])
    end
end