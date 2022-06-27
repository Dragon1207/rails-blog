json.extract! post, :id, :published, :name, :description, :keywords, :published_date, :created_at, :updated_at
json.url post_url(post, format: :json)
