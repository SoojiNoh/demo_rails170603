class ArtistExhibition < ActiveRecord::Base
    
    #Artist : Exhibition = M : N
    belongs_to :artist
    belongs_to :exhibition
end
