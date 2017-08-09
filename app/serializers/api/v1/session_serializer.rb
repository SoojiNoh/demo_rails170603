class Api::V1::SessionSerializer < ActiveModel::Serializer
    #just some basic attributes
  attributes :id, :email, :token

  def token
    object.authentication_token
  end
end
