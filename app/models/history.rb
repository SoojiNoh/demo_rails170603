class History < ActiveRecord::Base
    validates_presence_of :title
    
    #Artist : History = 1 : N
    belongs_to :artist
    
end
