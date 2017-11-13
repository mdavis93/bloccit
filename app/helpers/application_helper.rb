module ApplicationHelper
  def form_group_tag(errors, &bloc)
    css_class = 'form_group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&bloc), class: css_class
  end

  def avatar_url(user)
    "http://lorempixel.com/48/48/people"
  end
end
