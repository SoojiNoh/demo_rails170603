module ArtworksHelper
#   def setup_artwork(artwork)
#     # ... code from above omitted
#     # 1.times {
#     #     artwork.build;
#     # }
#     artwork
#   end
  
  def builder_artwork(artwork_builder)
    # ... code from above omitted

    
    # artist.contacts ||= Contact.new
    # puts artwork.object.spaces.present?
    # if !artwork_builder.object.spaces.present?
    #   artwork_builder.object.spaces.build
    # end
    # 1.times {
    #   artwork.object.spaces.build;
    # }
    artwork_builder
  end
end
