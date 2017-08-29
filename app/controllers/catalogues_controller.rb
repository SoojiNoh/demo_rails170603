class CataloguesController < ApplicationController
  before_action :set_catalogue, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :authenticate_artist
  before_action :error_messages_expose, only: :all
  
  # input ArrayInput

  # GET /catalogues
  # GET /catalogues.json
  def index
    @catalogues = current_user.catalogues.all
  end

  # GET /catalogues/1
  # GET /catalogues/1.json
  def show
  end

  # GET /catalogues/new
  def new
    @catalogue = current_user.catalogues.new
    
    # EXHIBITION preset
    @exhibition = @catalogue.exhibitions.new
    
    # ARTIST preset

    # EXHIBITION.SPACE preset
    @space = @exhibition.spaces.new
    @space.contacts.new(category: 'phone')
    @space.contacts.new(category: 'website')



    
    
    
    # @artwork = Artwork.new
    # @exhibition = Exhibition.new
    # @history = History.new
  end

  # GET /catalogues/1/edit
  def edit
    
  end

  # POST /catalogues
  # POST /catalogues.json
  def create
    @artist_params = catalogue_params.extract!(:artist_attributes)["artist_attributes"]
    @exhibition_params = catalogue_params.extract!(:exhibition_attributes)["exhibition_attributes"]

    # ARTIST sanitizing before CATALOGUE create
    @catalogue = current_user.catalogues.new(catalogue_params.except(:artist_attributes))


    
    respond_to do |format|
      if @catalogue.save
        # ARTIST updating, not creating
        current_user.artist.update(@artist_params)
        ArtistCatalogue.create(artist: current_user.artist, catalogue: @catalogue)
          
        # ARTIST : EXHIBITION = m : n, through ArtistExhibition
        @catalogue.exhibitions.each do |exhibition|
          ArtistExhibition.create(artist: current_user.artist, exhibition: exhibition)
        end
        
        format.html { redirect_to new_catalogue_artwork_path(@catalogue), notice: '도록이 성공적으로 등록되었습니다.' }
        # format.json { render :show, status: :created, location: @catalogue }
      else
        puts "########couldn't save catalogue" + @catalogue.errors.inspect
        format.html { render :new }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # def artwork_new
  #   # ARTWORK preset
  #   @artworks = @artist.artworks.all
  #   @artwork = @artist.artworks.new
  # end

  
  # def artwork_create
  #   # POST /catalogues
  #   # POST /catalogues.json
  #   # @catalogue = Catalogue.new(catalogue_params)
  #   @artwork = Artwork.new(artwork_params)

  #   respond_to do |format|
  #     if @catalogue.save
  #       format.html { redirect_to @catalogue, notice: 'Catalogue was successfully created.' }
  #       format.json { render :show, status: :created, location: @catalogue }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @catalogue.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /catalogues/1
  # PATCH/PUT /catalogues/1.json
  def update
    # @artist_params = catalogue_params.extract!(:artist_attributes)["artist_attributes"]
    @artist_params = catalogue_params.extract!(:artist_attributes)["artist_attributes"]
    @exhibition_params = catalogue_params.extract!(:exhibition_attributes)["exhibition_attributes"]

    respond_to do |format|
      if @catalogue.update(catalogue_params.except(:artist_attributes))
        # ARTIST updating, not creating
        current_user.artist.update(@artist_params)
        @catalogue.artist = current_user.artist

        format.html { redirect_to new_catalogue_artwork_path(@catalogue.id), notice: 'Catalogue was successfully updated.' }
        # format.json { render :show, status: :ok, location: @catalogue }
      else
        format.html { render :edit }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogues/1
  # DELETE /catalogues/1.json
  def destroy
    @catalogue.destroy
    respond_to do |format|
      format.html { redirect_to catalogues_url, notice: 'Catalogue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogue
      @catalogue = Catalogue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalogue_params
      params.require(:catalogue).permit(:title, :description)
    end
    def catalogue_params
      params.require(:catalogue).permit(:title, :description,
        # exhibitions_attributes: [Exhibition.attribute_names.map(&:to_sym), spaces_attributes: Space.attribute_names.map(&:to_sym)],
        artist_attributes: [Artist.attribute_names.map(&:to_sym),         contacts_attributes: Contact.attribute_names.map(&:to_sym).push(:_destroy),
          histories_attributes: History.attribute_names.map(&:to_sym).push(:_destroy),
          exhibitions_attributes: [Exhibition.attribute_names.map(&:to_sym).push(:_destroy),
            spaces_attributes: Space.attribute_names.map(&:to_sym)
          ]
        ],
        exhibitions_attributes: [Exhibition.attribute_names.map(&:to_sym),
          spaces_attributes: [Space.attribute_names.map(&:to_sym), contacts_attributes: Contact.attribute_names.map(&:to_sym).push(:_destroy)]
        ],
        pages_attributes: Page.attribute_names.map(&:to_sym)
        # artworks_attributes: [Artwork.attribute_names(&:to_sym).push(:_destroy, :image_cache)],
      )
    end
    
    def artwork_params
      params.require(:artwork).permit(:artwork, :type, :photo, :title, {size: []}, :unit, :material, :created_date)
    end
    
    # def artist_params
    #   params.require(:artist).permit(:name, :role,
    #     contacts_attributes: Contact.attribute_names.map(&:to_sym).push(:_destroy),
    #     histories_attributes: History.attribute_names.map(&:to_sym).push(:_destroy),
    #     exhibitions_attributes: [Exhibition.attribute_names.map(&:to_sym).push(:_destroy), spaces_attributes: Space.attribute_names.map(&:to_sym)])
    # end
    

    def error_messages_expose
      flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
    end
end
