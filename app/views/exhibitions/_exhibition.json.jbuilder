json.extract! exhibition, :id, :category, :title, :start_date, :end_date, :create_at, :updated_at
json.url exhibition_url(exhibition, format: :json)