module EventHelper
  def participate_helper(event)
    return nil unless logged_in? && event.date > Time.now

    if event.attendees.include?(current_user)
      link_to 'Cancel Participation', destroy_participation_path, method: 'delete', class: 'button is-danger mt-3'
    else
      link_to 'Participate', participate_path, class: 'button is-primary mt-3'
    end
  end

  def form_default_styling(sym = 'default')
    case sym
    when :date
      { as: :date, html5: true, wrapper: false, label_html: { class: 'label m-0' }, input_html: { class: 'm-3' } }
    when :description
      { as: :text, wrapper: false, label_html: { class: 'label m-0' }, input_html: { class: 'm-3' } }
    else
      { wrapper: false, label_html: { class: 'label m-0' }, input_html: { class: 'm-3' } }
    end
  end
end
