class Artwork < ActiveRecord::Base
 
    # before_save :remove_blank_sizes

    # def remove_blank_sizes
    #   self.size.reject!(&:blank?)
    # end
    #Artist : Artwork = M : N
    has_many :artists, through: :artist_artworks
    mount_uploader :image, ArtworkImgUploader
    # mount_uploader :image_url, ArtworkImgUploader
    # mount_uploader :thumbnail_url, ArtworkImgUploader
end
