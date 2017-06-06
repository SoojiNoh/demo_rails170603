class Player < ActiveRecord::Base
    
    #Catalogue : Player = 1 : 0
    belongs_to :catalogue
end
