class ExhibitionSpace < ActiveRecord::Base

    #Exhibition : Space = M : N
    belongs_to :exhibition
    belongs_to :space
    
end
