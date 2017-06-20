class Catalogue < ActiveRecord::Base
    
    #User, Artist : Catalogue = 1 : N
    belongs_to :user
    belongs_to :artist
    accepts_nested_attributes_for :artist
   
    #Catalogue : Page = 1 : N
    has_many :pages
    
    #Catalogue : Player = 1 : 0
    has_one :player
    
    #Catalogue : Artwork = M : N
    has_many :artworks, through: :artwork_catalogues
    accepts_nested_attributes_for :artworks
    
    #Catalogue : Exhibition = M : N
    has_many :exhibitions, through: :catalogue_exhibitions
    has_many :catalogue_exhibitions
    accepts_nested_attributes_for :exhibitions
    accepts_nested_attributes_for :catalogue_exhibitions, allow_destroy: true

end
