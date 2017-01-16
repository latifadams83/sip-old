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
end
