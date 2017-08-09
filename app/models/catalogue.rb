class Catalogue < ActiveRecord::Base
    
    #User, Artist : Catalogue = 1 : N
    belongs_to :user
    belongs_to :artist
    accepts_nested_attributes_for :artist
   
    #Catalogue : Page = 1 : N
    has_many :pages
    
    #Catalogue : Player = 1 : 0
    has_one :player
    
    #Catalogue : Artwork = M : N
    has_many :artworks, through: :artwork_catalogues
    has_many :artwork_catalogues
    accepts_nested_attributes_for :artworks
    accepts_nested_attributes_for :artwork_catalogues
    
    #Catalogue : Exhibition = M : N
    has_many :exhibitions, through: :catalogue_exhibitions
    has_many :catalogue_exhibitions
    accepts_nested_attributes_for :exhibitions
    accepts_nested_attributes_for :catalogue_exhibitions, allow_destroy: true

    #Catalogue : ApiKey = 1 : 0
    has_one :api_key, as: :accessible, dependent: :destroy
    accepts_nested_attributes_for :api_key, allow_destroy: true


    before_save :ensure_api_key

      def ensure_api_key
        if self.api_key.blank?
          self.api_key = generate_api_key
        end
      end
    
      private
      
      def generate_api_key
        loop do
          api_key = ApiKey.create!
          puts "##########"+self.inspect
          break api_key unless self.api_key
        end
      end
end
