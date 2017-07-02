class Artwork < ActiveRecord::Base

    has_many :artists, through: :artist_artworks
    mount_uploader :image, ArtworkImgUploader
    # mount_uploader :image_url, ArtworkImgUploader
    # mount_uploader :thumbnail_url, ArtworkImgUploader
    
    before_create :default_name

    def default_name
      self.title ||= File.basename(image.filename, '.*').titleize if image
    end
end
