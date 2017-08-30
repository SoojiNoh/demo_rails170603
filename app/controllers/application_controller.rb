class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def permission_catalogue
    if current_user != Catalogue.find(params[:id]).user
      respond_to do |format|
        format.html { redirect_to "/", notice: '올바른 접근이 아닙니다.'}
        # format.json { head :no_content }
      end
    end
  end  

  def permission_artist
    if current_user != Artist.find(params[:id]).user
      respond_to do |format|
        format.html { redirect_to "/", notice: '올바른 접근이 아닙니다.'}
        # format.json { head :no_content }
      end
    end
  end  
  
  def permission_artwork
    if Artwork.find(params[:id]).artists.find_by_id(current_user.artist.id).nil?
      respond_to do |format|
        format.html { redirect_to "/", notice: '올바른 접근이 아닙니다.'}
        # format.json { head :no_content }
      end
    end
  end  
  

  
    def authenticate_artist
      if current_user.artist.nil?
      respond_to do |format|
        format.html { redirect_to "/artists", notice: '본 기능을 위해서는 아티스트 등록이 필요합니다'}
        # format.json { head :no_content }
      end
      end
    end
    
end
