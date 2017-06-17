class Contact < ActiveRecord::Base
    # validates_presence_of :content
    
    #Artist : Contact = 1 : N, Spaces : Contact = 1 : N
    belongs_to :contactable, polymorphic: true
end
