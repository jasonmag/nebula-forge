module ApplicationHelper

  def valid_link?(link)
    uri = URI.parse(link)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
  
end
