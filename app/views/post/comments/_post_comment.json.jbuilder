json.extract! post_comment, :id, :comment, :post_id, :user_id, :created_at, :updated_at
json.url post_comment_url(post_comment, format: :json)
