class CalendarService
  def self.make_calendar(month, year, user = nil)
    if month then month = month.to_i
    else month = Date.today.month
    end

    if year then year = year.to_i
    else year = Date.today.year
    end

    date = Date.new year, month, 1
    if user
      events = user.events.calendar(date)
    else
      events = Event.calendar(date)
    end
    calendar_events = Array.new date.at_end_of_month.day, []
    date.at_end_of_month.day.times do |i|

      calendar_events[i] = OpenStruct.new
      calendar_events[i].date = Date.new(year, month, i+1)
      calendar_events[i].events = EventsDecorator.new (events.select do |event| 
        ((event.empty? || event.monthly? || event.annually?) && event.date.day == i+1) ||
        event.daily? || 
        (event.weekly? && event.date.wday == Date.new(year, month, i+1).wday)
      end)
    end
    calendar_events
  end

  def self.get_offset(month, year)
    if month then month = month.to_i
    else month = Date.today.month
    end
    
    if year then year = year.to_i
    else year = Date.today.year
    end

    day = Date.new(year, month, 1).wday
    return 6 if day == 0
    day-1
  end

  private
  def self.months
    Date::MONTHNAMES[1..-1].map(&:downcase)
  end
end