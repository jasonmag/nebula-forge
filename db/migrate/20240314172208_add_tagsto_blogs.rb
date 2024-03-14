class AddTagstoBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :tags, :string
  end
end
