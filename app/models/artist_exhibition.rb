class ArtistExhibition < ActiveRecord::Base
    
    #Artist : Exhibition = M : N
    belongs_to :artist
    belongs_to :exhibition
    accepts_nested_attributes_for :artist, allow_destroy: true
    accepts_nested_attributes_for :exhibition, allow_destroy: true

end
