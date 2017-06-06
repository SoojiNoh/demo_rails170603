class Catalogue < ActiveRecord::Base
    
    #User, Artist, Space : Catalogue = 1 : N
    belongs_to :user
    belongs_to :artist
    belongs_to :space
    
    
    #Catalogue : Exhibition = M : N
    has_many :exhibitions, through: :catalogue_exhibitions
    accepts_nested_attributes_for :exhibitions
end
