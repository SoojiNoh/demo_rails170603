class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at
  
  has_many :catalogues
  has_one :artist

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end  
end
