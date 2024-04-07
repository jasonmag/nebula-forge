module ApplicationHelper

  def valid_link?(link)
    uri = URI.parse(link)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end

  # Truncate long collection of characters
  def truncate_body_for_preview(post)
    truncate(strip_tags(post.body), length: 300, separator: ' ')
  end
  
end
