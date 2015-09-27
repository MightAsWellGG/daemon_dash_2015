json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :isbn, :condition, :price, :user_email, :comments, :course_name
  json.url listing_url(listing, format: :json)
end
