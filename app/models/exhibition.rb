class Exhibition < ActiveRecord::Base
    
    #Artist : Exhibition = M : N
    has_many :artists, through: :artist_exhibitions
    
    #Catalogue : Exhibition = M : N
    has_many :catalogues, through: :catalogue_exhibitions
    
    #Exhibition : Space = M : N
    has_many :spaces, through: :exhibition_spaces
end
