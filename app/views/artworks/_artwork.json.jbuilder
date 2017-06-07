json.extract! artwork, :id, :category, :artist_name, :photo, :title, :size, :width, :height, :material, :created_date, created_at, :updated_at
json.url artwork_url(artwork, format: :json)