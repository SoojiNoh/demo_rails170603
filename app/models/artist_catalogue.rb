class ArtistCatalogue < ActiveRecord::Base
  belongs_to :artist
  belongs_to :catalogue
  accepts_nested_attributes_for :artist, allow_destroy: true
  accepts_nested_attributes_for :catalogue, allow_destroy: true

end
