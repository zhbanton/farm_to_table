module ApplicationHelper
  def my_devise_error_messages!
    return "" if resource.errors.empty? && resource.rolable.errors.empty?

    messages = rolable_messages = ""

    if !resource.errors.empty?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    end

    if !resource.rolable.errors.empty?
      rolable_messages = resource.rolable.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    end

    messages = messages + rolable_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count + resource.rolable.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
    <h2>#{sentence}</h2>
    <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def time_select
    hours = (5..11).map { |t| "#{t}:00 AM"}.push('12:00 PM') + (1..10).map { |t| "#{t}:00 PM"}
    half_hours = (5..11).map { |t| "#{t}:30 AM"}.push('12:30 PM') + (1..10).map { |t| "#{t}:30 PM"}
    hours.zip(half_hours).flatten.push('11:00 PM')
  end
end
