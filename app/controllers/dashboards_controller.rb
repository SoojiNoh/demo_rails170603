class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @catalogues = current_user.catalogues
    
    @exhibitions = current_user.artist ? current_user.artist.exhibitions : ""
    
    if @exhibitions.present?
      @exhibitions_current = []
      @exhibitions.each do |exhibition|
        if exhibition.start_date && exhibition.start_date <= Date.today && exhibition.end_date && Date.today <= exhibition.end_date
          @exhibitions_current.push(exhibition)
        end
      end
    end
    
    @artist = current_user.artist
    @artworks = @artist? @artist.artworks.all : nil
    
    @notices = Notice.all

  end

  def notices
    @notice = Notice.find(params[:id])
    
    respond_to do |format|
        format.js { render 'dashboards/notices.js.erb' }
    end    
  end

end
