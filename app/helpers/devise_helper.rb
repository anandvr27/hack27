module DeviseHelper

  def devise_error_messages!

    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    # binding.pry
    html = <<-HTML
    <div id="error_explanation" style="color: red">
      <ul><li>#{messages}</li></ul>
      </br>
    </div>
    HTML

    html.html_safe
  end
end