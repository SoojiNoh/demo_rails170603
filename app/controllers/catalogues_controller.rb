class CataloguesController < ApplicationController
  before_action :set_catalogue, only: [:show, :edit, :update, :destroy]
  # input ArrayInput

  # GET /catalogues
  # GET /catalogues.json
  def index
    @catalogues = Catalogue.all
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
    if current_user.artist.present?
      @artist = current_user.artist
    else
      @artist = current_user.build_artist
    end
    
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
    if @catalogue.artist.present?
      @artist = @catalogue.artist
    else
      @artist = current_user.build_artist
    end
  end

  # POST /catalogues
  # POST /catalogues.json
  def create
    @artist_params = catalogue_params.extract!(:artist_attributes)["artist_attributes"]

    # ARTIST process
    if current_user.artist.present?
      @catalogue = current_user.catalogues.new(catalogue_params.except(:artist_attributes))
      @catalogue.artist_id = @artist_params["id"]
    else
      @catalogue = current_user.catalogues.new(catalogue_params)
    end
    
    # @artwork = Artwork.new(artwork_params)
    # @artist = Artist.new(artist_params)
    # @contact = Contact.new(contact_params)
    # @history = History.new(history_params)
    
    
    respond_to do |format|
      if @catalogue.save
        if current_user.artist.present?
          Artist.find_by_id(@catalogue.artist_id).update(@artist_params)
        else
          current_user.create_artist(@artist_params)
        end
        format.html { redirect_to edit_catalogue_path(@catalogue), notice: 'Catalogue was successfully created.' }
        format.json { render :show, status: :created, location: @catalogue }
      else
        format.html { render :new }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def artwork_create
    # POST /catalogues
    # POST /catalogues.json
    # @catalogue = Catalogue.new(catalogue_params)
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @catalogue.save
        format.html { redirect_to @catalogue, notice: 'Catalogue was successfully created.' }
        format.json { render :show, status: :created, location: @catalogue }
      else
        format.html { render :new }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogues/1
  # PATCH/PUT /catalogues/1.json
  def update
    
    respond_to do |format|
      if @catalogue.update(catalogue_params)
        @artist=Artist.find_by_id(@artist_params["id"])
        if current_user.artist.present?
          @artist.update(@artist_params)
        else
          current_user.create_artist(@artist_params)
        end
        format.html { redirect_to edit_catalogue_path(@catalogue), notice: 'Catalogue was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalogue }
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
        ]
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
    
    def contact_params
      params.require(:contact).permit(:name, :role, :academic, :user_id)
    end
    
    def history_params
      params.require(:history).permit(:category, :title, :academic, :user_id)
    end
end
