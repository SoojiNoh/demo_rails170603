json.extract! catalogue, :id, :user_id, :artist_id, :space_id, :title, :description, :created_at, :updated_at
json.url catalogue_url(catalogue, format: :json)