class Web::User::CalendarsController < Web::User::ApplicationController
  def show
    @events = CalendarService.make_calendar(params[:month], params[:year], current_user)
    @offset = CalendarService.get_offset(params[:month], params[:year])
  end
end