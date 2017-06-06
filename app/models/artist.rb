class Artist < ActiveRecord::Base
    
    #Artist : History = 1 : N
    has_many :histories
    
    #Artist : Contact = 1 : N
    has_many :contacts, as: :contactable
    
    #Artist : Catalogue = 1 : N
    has_many :catalogues
    
    #Artist : Exhibition = M : N
    has_many :exhibitions, through: :artist_exhibitions
end
