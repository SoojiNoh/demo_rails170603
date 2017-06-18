module ExhibitionsHelper
    
  def field_exhibition(exhibition)
    # ... code from above omitted

    
    # artist.contacts ||= Contact.new
    # puts exhibition.object.spaces.present?
    if !exhibition.object.spaces.present?
      exhibition.object.spaces.build
    end
    # 1.times {
    #   exhibition.object.spaces.build;
    # }
    exhibition
  end
  
end
