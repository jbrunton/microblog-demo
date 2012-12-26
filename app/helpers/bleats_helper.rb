module BleatsHelper
  def linkify_tag(tag)
    link_to tag, controller: 'bleats', action: 'trending', tag: tag
  end

  def linkify_content(content)
    content.gsub(/#[A-Za-z0-9]+/) { |tag| linkify_tag(tag) }.html_safe
  end
end
