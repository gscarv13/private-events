module UserHelper
  def events(user)
    out = ''
    if !user.events.empty?
      render 'created_events'
    else
      out << "<br><p class='has-text-danger'>You haven't created any events</p><br>"
      out.html_safe
    end
  end

  def display_errors(user)
    render 'shared/errors' if user.errors.any?
  end
end
