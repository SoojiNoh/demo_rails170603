class Artwork < ActiveRecord::Base
    #Artist : Artwork = 1 : N
    belongs_to :artist
end
