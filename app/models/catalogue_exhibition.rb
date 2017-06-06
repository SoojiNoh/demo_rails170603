class CatalogueExhibition < ActiveRecord::Base
    
    #Catalogue : Exhibition = M : N
    belongs_to :catalogue
    belongs_to :exhibition
end
