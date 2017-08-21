module ArtistsHelper
  def setup_artist(artist)
    # ... code from above omitted

    if !artist.contacts.find_by_category("phone").present?
      artist.contacts.build(contactable: artist, category: "phone")
    end
    
    if !artist.contacts.find_by_category("email").present?
      artist.contacts.build(contactable: artist, category: "email");
    end
    # artist.contacts ||= Contact.new
    # artist.histories ||= History.new
    
    if !artist.histories.find_by_category('academic').present?
      artist.histories.build(category: 'academic');
    end
    
    if !artist.histories.find_by_category('award').present?
      artist.histories.build(category: 'award');
    end
    
    if !artist.exhibitions.present?
      artist.exhibitions.build
    end
    
    # 1.times {
    #     artist.contacts.build(contactable: artist);
    #     # artist.histories.build(category: 'academic');
    #     # artist.histories.build(category: 'award');
    #     artist.exhibitions.build;
    # }
    artist
  end
end
