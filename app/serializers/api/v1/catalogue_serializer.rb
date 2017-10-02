class Api::V1::CatalogueSerializer < ActiveModel::Serializer
  attributes :id, :artists, :exhibitions, :artworks, :pages, :title, :description,  :created_at, :updated_at
end
