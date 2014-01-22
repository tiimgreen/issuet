module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      content_tag(:li, msg)
    end.join
    sentence = I18n.t(
      'errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = generate_html(sentence, messages)

    html.html_safe
  end

  def generate_html(sentence, messages)
    <<-HTML
    <div class='alert alert-warning'>
      <h4>#{sentence}</h4>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML
  end
end
