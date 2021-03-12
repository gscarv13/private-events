class EventsController < ApplicationController
  def index
    @future = Event.upcomming_events
    @past = Event.past_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def participate
    @event = Event.find(params[:id])

    if @event.attendees.include?(current_user)
      flash[:alert] = 'You are already participating'
    else
      @attendance = Attendance.create(attendee: current_user, attended_event: @event)
      flash[:notice] = 'Added successfully'
    end

    redirect_to @event
  end

  def cancel_participation
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    flash[:alert] = 'You are no longer on the attendance list'

    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :description)
  end
end
