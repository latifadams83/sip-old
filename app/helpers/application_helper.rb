module ApplicationHelper
  def error_messages_for(object)
    render(partial: "application/error_messages", locals: {object: object})
  end

  def alert_messages(alert)
    render(partial: "application/alert_messages", locals: {msg: alert})
  end

  def notice_messages(notice)
    render(partial: "application/alert_messages", locals: {msg: notice})
  end

  def user_menu(user)
    render(partial: "layouts/menu", locals: {user: user})
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    css_classes = column == sort_column ? "current-column #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.permit(:sort, :direction, :page, :k).merge(:sort => column, :direction => direction, :page => nil), {class: "#{css_classes}"}
  end
end
