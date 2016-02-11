class Web::User::EventsController < Web::User::ApplicationController 
  before_filter :set_event, only: [:update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new event_params
    if @event.save
      redirect_to user_calendar_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update event_params
      redirect_to user_calendar_path
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to user_calendar_path
  end

  private 
  def event_params
    params.require(:event).permit(:title, :date, :reiteration)
  end

  def set_events
    @events = current_user.events.page(params[:page]).decorate
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end
