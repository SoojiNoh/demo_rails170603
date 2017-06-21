module ExhibitionsHelper
    
  def setup_exhibition(exhibiton)
  end 
  def builder_exhibition(exhibition_builder)
    # ... code from above omitted

    
    # artist.contacts ||= Contact.new
    # puts exhibition.object.spaces.present?
    if !exhibition_builder.object.spaces.present?
      exhibition_builder.object.spaces.build
    end
    # 1.times {
    #   exhibition.object.spaces.build;
    # }
    exhibition_builder
  end
  
end
