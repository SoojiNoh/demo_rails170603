class Space < ActiveRecord::Base
    #Space : Contact = 1 : N
    has_many :contacts, as: :contactable
    
    #Exhibition : Space = M : N
    has_many :exhibitions, through: :exhibition_spaces
    
end
