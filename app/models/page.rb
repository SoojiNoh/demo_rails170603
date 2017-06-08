class Page < ActiveRecord::Base
    
    #Catalogue : Page = 1 : N
    belongs_to :catalogue
    
end
