class Artist < ActiveRecord::Base

    #User : Artist = 1 : 1
    belongs_to :user
    
    #Artist : History = 1 : N
    has_many :histories
    accepts_nested_attributes_for :histories, reject_if: proc { |attributes| attributes['title'].blank? }
    
    #Artist : Contact = 1 : N
    has_many :contacts, as: :contactable
    accepts_nested_attributes_for :contacts, reject_if: proc { |attributes| attributes['category'].blank? or attributes['content'].blank? }
    
    #Artist : Catalogue = 1 : N
    has_many :catalogues
    
    #Artist : Artwork = M : N
    has_many :artworks, through: :artist_artworks
    
    #Artist : Exhibition = M : N
    has_many :exhibitions, through: :artist_exhibitions
    
end
