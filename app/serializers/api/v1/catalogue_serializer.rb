class Api::V1::CatalogueSerializer < ActiveModel::Serializer
  attributes :id, :artist, :exhibitions, :artworks, :pages, :title, :description,  :created_at, :updated_at
end
