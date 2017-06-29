class Artist < ActiveRecord::Base
    # validates_presence_of :name

    #User : Artist = 1 : 1
    belongs_to :user
    
    #Artist : History = 1 : N
    has_many :histories, dependent: :destroy
    accepts_nested_attributes_for :histories, allow_destroy: true,  reject_if: proc { |attributes| attributes['title'].blank? }
    
    #Artist : Contact = 1 : N
    has_many :contacts, as: :contactable, dependent: :destroy
    accepts_nested_attributes_for :contacts, allow_destroy: true,  reject_if: proc { |attributes| attributes['category'].blank? or (attributes['category']!="email" and attributes['category']!="phone" and attributes['content'].blank?) }
    
    #Artist : Catalogue = 1 : N
    has_many :catalogues
    
    #Artist : Artwork = M : N
    has_many :artworks, through: :artist_artworks
    
    #Artist : Exhibition = M : N
    has_many :exhibitions, through: :artist_exhibitions
    has_many :artist_exhibitions
    accepts_nested_attributes_for :artist_exhibitions, allow_destroy: true
    accepts_nested_attributes_for :exhibitions, allow_destroy: true,  reject_if: proc { |attributes| attributes['title'].blank?}
   
  
end
