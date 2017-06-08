class Contact < ActiveRecord::Base
    
    #Artist : Contact = 1 : N, Spaces : Contact = 1 : N
    belongs_to :contactable, polymorphic: true
end
