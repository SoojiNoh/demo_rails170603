class Exhibition < ActiveRecord::Base
    validates_presence_of :title, allow_blank: false
    
    #Artist : Exhibition = M : N
    has_many :artists, through: :artist_exhibitions
    
    #Catalogue : Exhibition = M : N
    has_many :catalogues, through: :catalogue_exhibitions
    has_many :catalogue_exhibitions
    
    #Exhibition : Space = M : N
    has_many :spaces, through: :exhibition_spaces
    has_many :exhibition_spaces
    accepts_nested_attributes_for :exhibition_spaces, allow_destroy: true
    accepts_nested_attributes_for :spaces, allow_destroy: true,  reject_if: proc { |attributes| puts attributes['name'].blank?}

end
