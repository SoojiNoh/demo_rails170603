class Space < ActiveRecord::Base
    #Space : Contact = 1 : N
    has_many :contacts, as: :contactable
    
    #Space : Catalogue = 1 : N
    has_many :catalogues
end
