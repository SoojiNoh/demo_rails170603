json.extract! history, :id, :category, :title, :start_date, :end_date, :artist_id, :create_at, :updated_at
json.url history_url(history, format: :json)