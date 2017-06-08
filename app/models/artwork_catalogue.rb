class ArtworkCatalogue < ActiveRecord::Base
    #Artwork : Catalogue = M : N
    belongs_to :artwork
    belongs_to :catalogue
end
