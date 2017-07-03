class ArtworkCatalogue < ActiveRecord::Base
    #Artwork : Catalogue = M : N
    belongs_to :artwork
    belongs_to :catalogue
    accepts_nested_attributes_for :artwork, allow_destroy: true
    accepts_nested_attributes_for :catalogue, allow_destroy: true

end
