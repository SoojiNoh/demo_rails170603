class Artwork < ActiveRecord::Base
    mount_uploader :image, ArtworkImgUploader

    #Artist : Artwork = M : N
    has_many :artists, through: :artist_artworks
    has_many :artist_artworks
    # mount_uploader :image_url, ArtworkImgUploader
    # mount_uploader :thumbnail_url, ArtworkImgUploader

    #Catalogue : Artwork = M : N
    has_many :catalogues, through: :artwork_catalogues, dependent: :destroy
    has_many :artwork_catalogues


    
    before_create :default_name

    def default_name
      self.title ||= File.basename(image.filename, '.*').titleize if image
    end
end
