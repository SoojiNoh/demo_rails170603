class History < ActiveRecord::Base
    #Artist : History = 1 : N
    belongs_to :artist
    
end
