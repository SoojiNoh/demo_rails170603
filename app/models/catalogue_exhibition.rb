class CatalogueExhibition < ActiveRecord::Base
    
    #Catalogue : Exhibition = M : N
    belongs_to :catalogue
    belongs_to :exhibition
    accepts_nested_attributes_for :catalogue, allow_destroy: true
    accepts_nested_attributes_for :exhibition, allow_destroy: true

end
