class ExhibitionSpace < ActiveRecord::Base

    #Exhibition : Space = M : N
    belongs_to :exhibition
    belongs_to :space
    accepts_nested_attributes_for :exhibition, allow_destroy: true
    accepts_nested_attributes_for :space, allow_destroy: true,  reject_if: proc { |attributes| puts attributes['name'].blank?}

    
end
