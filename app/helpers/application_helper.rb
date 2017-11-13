module ApplicationHelper
  def form_group_tag(errors, &bloc)
    css_class = 'form_group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&bloc), class: css_class
  end

=begin
  def render_confirm
    output = ""
    parm = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    output += link_to("Submit", users_path, method: :post, params: parm, class: "btn btn-success" )
    output.html_safe
  end

  # On Vie #  <%= render_confirm %>
=end
end
