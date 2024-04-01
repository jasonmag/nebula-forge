json.extract! blog, :id, :title, :content, :published, :image_source, :created_at, :updated_at
json.url blog_url(blog, format: :json)
