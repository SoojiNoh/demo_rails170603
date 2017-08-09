class Api::V1::CatalogueSerializer < ActiveModel::Serializer
  attributes :id, :artist, :exhibitions, :artworks, :title, :description,  :created_at, :updated_at
end
