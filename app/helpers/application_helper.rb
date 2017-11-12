module ApplicationHelper
  def form_group_tag(errors, &bloc)
    css_class = 'form_group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&bloc), class: css_class
  end
end
