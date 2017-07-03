json.extract! catalogue, :id, :user, :artist, :exhibitions, :artworks, :title, :description, :created_at, :updated_at
json.url catalogue_url(catalogue, format: :json)