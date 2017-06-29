json.extract! artwork, :id, :category, :image, :title, :size, :unit, :material, :created_date
json.url artwork_url(artwork, format: :json)