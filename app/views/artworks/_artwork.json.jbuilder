json.extract! artwork, :id, :category, :photo, :title, :size, :unit, :material, :created_date
json.url artwork_url(artwork, format: :json)