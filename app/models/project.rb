class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_rich_text :content

  def self.published_for_user(user)
    if user.present? # Check if the user exist
      all # If user is admin, return all project posts
    else
      self.published # Otherwise, return only published project posts
    end
  end
  
  def self.published # return only published blogs
    where(published: true)
  end
end
