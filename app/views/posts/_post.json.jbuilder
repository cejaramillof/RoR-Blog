json.extract! post, :id, :title, :body, :free, :guest, :athlete, :advised, :created_at, :updated_at
json.url post_url(post, format: :json)
