class ContactsController < ApplicationController
  before_filter :load_contactable
  def index
    @contactable = Artist.find(params[:artist_id])
    @contacts = @contactable.contacts
  end

  def new
  end
  
  private
  def load_contactable
    resource, id = request.path.split('/')[1, 2]
    @contactable = resource.singularize.classify.constantize.find(id)
  end
  
  # def load_contactable
    # klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
    # @contactable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end
