class Artwork < ActiveRecord::Base
    #Artist : Artwork = M : N
    has_many :artists, through: :artist_artworks
end
