json.extract! project, :id, :title, :content, :tags, :image_source, :author_id, :published, :created_at, :updated_at
json.url project_url(project, format: :json)
