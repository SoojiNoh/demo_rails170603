class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  
    def authenticate_artist
      if current_user.artist.nil?
      respond_to do |format|
        format.html { redirect_to "/artists", notice: '본 기능을 위해서는 아티스트 등록이 필요합니다'}
        # format.json { head :no_content }
      end
      end
    end
    
end
