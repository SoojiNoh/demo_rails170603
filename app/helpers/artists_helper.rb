module ArtistsHelper
  def setup_artist(artist)
    # ... code from above omitted

    
    # artist.contacts ||= Contact.new
    # artist.histories ||= History.new
    1.times {
        artist.contacts.build(:contactable => artist);
        artist.histories.build
    }
    artist
  end
end
