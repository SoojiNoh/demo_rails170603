module SpacesHelper
  def setup_space(space)
    # ... code from above omitted

    if !space.contacts.find_by_category("phone").present?
      spaces.contacts.build(contactable: space, category: "phone")
    end
    
    if !space.contacts.find_by_category("website").present?
      spaces.contacts.build(contactable: space, category: "website");
    end
    
    # space.contacts ||= Contact.new
    # space.histories ||= History.new
    1.times {
        space.contacts.build(:contactable => space);
    }
    space
  end
end
