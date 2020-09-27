json.extract! post, :id, :content, :title, :mood, :created_at, :updated_at
json.url post_url(post, format: :json)
