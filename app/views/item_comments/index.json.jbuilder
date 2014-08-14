json.array!(@item_comments) do |item_comment|
  json.extract! item_comment, :id, :body, :user_id
  json.url item_comment_url(item_comment, format: :json)
end
