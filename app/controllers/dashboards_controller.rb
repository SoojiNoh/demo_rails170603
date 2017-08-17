class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @catalogues = current_user.catalogues
    @catalogue_latest = @catalogues? @catalogues.last : nil
    @exhibition_latest = @catalogue_latest? @catalogue_latest.exhibitions.first : nil
    if @exhibition && @exhibition_latest.start_date < Date.today && Date.today < @exhibition_latest.end_date
      @catalogue_current = @catalogue_latest
      @exhibition_current = @exhibition_latest
    else
      @catalogue_current = nil
      @exhibition_current = nil
    end
    
    @artist = current_user.artist
    @artworks = @artist? @artist.artworks : nil

  end

end
