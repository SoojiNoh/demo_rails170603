class Exhibition < ActiveRecord::Base
    
    #Artist : Exhibition = M : N
    has_many :artists, through: :artist_exhibitions
    
    #Catalogue : Exhibition = M : N
    has_many :catalogues, through: :catalogue_exhibitions
end
