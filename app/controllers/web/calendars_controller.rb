class Web::CalendarsController < Web::ApplicationController
  def show
    @events = CalendarService.make_calendar(params[:month], params[:year])
    @offset = CalendarService.get_offset(params[:month], params[:year])
  end
end
