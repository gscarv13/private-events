module ApplicationHelper
  def nav_buttons
    output = ''
    if logged_in?
      output << "<strong>Welcome #{link_to current_user.username} </strong>"
      output << (link_to 'New Event', new_event_path, class: 'button is-light ml-3')
      output << (link_to 'Log out', destroy_session_path, method: 'delete', class: 'button is-primary ml-1')
    else
      output << (link_to 'Log in', login_path, class: 'button is-light')
      output << (link_to 'Sign up', new_user_path, class: 'button is-primary ml-5')
    end
    output.html_safe
  end

  def flash_alert
    render 'shared/flash_alert' if flash[:alert]
  end

  def flash_notice
    render 'shared/flash_notice' if flash[:notice]
  end
end
