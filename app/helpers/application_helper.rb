module ApplicationHelper

  def url_to_image string
    string.gsub! /\s(https:\/\/.*?)\s/,
                  '<p><img src="\1"/></p>'
    string.html_safe
  end

end
