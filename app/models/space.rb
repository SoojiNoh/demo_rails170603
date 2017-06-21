class Space < ActiveRecord::Base
    #Space : Contact = 1 : N
    has_many :contacts, as: :contactable
    accepts_nested_attributes_for :contacts, allow_destroy: true,  reject_if: proc { |attributes| attributes['category'].blank? or (attributes['category']!="email" and attributes['category']!="phone" and attributes['content'].blank?) }
    
    #Exhibition : Space = M : N
    has_many :exhibitions, through: :exhibition_spaces
    
end
