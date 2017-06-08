class ArtistArtwork < ActiveRecord::Base
    #Artist : Artwork = M : N
    belongs_to :artist
    belongs_to :artwork
end
