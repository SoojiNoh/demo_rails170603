class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :reject_create, except: [:index, :show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # helper FormHelper
  
  
  # GET /artists
  # GET /artists.json
  def index
    @artist = current_user.artist
    if @artist.present?
      @contact_artist = @artist.contacts.all
      @exhibitions_single_artist =  @artist.exhibitions.find_by_category("single")
      @exhibitions_group_artist =  @artist.exhibitions.find_by_category("group")
      @histories_academic_artist = @artist.histories.find_by_category("academic")
      @histories_award_artist = @artist.histories.find_by_category("award")
    end
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
  end

  # GET /artists/new
  def new

    @artist = Artist.new
    
    # @email = @artist.contacts.new(category: 'email')
    # @phone = @artist.contacts.new(category: 'phone')
    # puts (">>>>>>>>>>>>>>#{@email.category}>>>>>>>>>>#{@phone.category}")
  end

  # GET /artists/1/edit
  def edit

  end
  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user

    respond_to do |format|
      if @artist.save
        # if (@artist.contacts.find_by_category("email").nil)
        #   @artist.contacts.create(category: "email", content: params[:artist_email])
        # end
        # if (@artist.contacts.find_by_category("email").nil)
          
        # @email = @artist.contacts.create(category: "email", content: params[:artist_email])
        # @phone = @artist.contacts.create(category: "phone", content: params[:artist_phone])
        format.html { redirect_to edit_artist_path(@artist), notice: '아티스트가 성공적으로 생성되었습니다.' }
        # format.json { render :show, status: :created, location: @artist }
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
        format.html { redirect_to edit_artist_path(@artist), notice: '아티스트가 성공적으로 등록되었습니다.' }
        # format.json { render :show, status: :ok, location: @artist }
      else
        puts "########couldn't save artist" + @artist.errors.inspect

        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  # def destroy
  #   @artist.destroy
  #   respond_to do |format|
  #     format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
  #     # format.json { head :no_content }
  #   end
  # end

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
          format.html { redirect_to artists_url, notice: '이미 등록된 아티스트 계정이 있습니다.' }
        end
      end
    end
    
    def artist_params
      params.require(:artist).permit(:name, :role,
        contacts_attributes: Contact.attribute_names.map(&:to_sym).push(:_destroy),
        histories_attributes: History.attribute_names.map(&:to_sym).push(:_destroy),
        exhibitions_attributes: [Exhibition.attribute_names.map(&:to_sym).push(:_destroy), spaces_attributes: Space.attribute_names.map(&:to_sym)])
    end
    
    
end