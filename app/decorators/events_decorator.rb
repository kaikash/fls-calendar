class EventsDecorator < ApplicationDecorator
  delegate_all

  def count_to_show
    events = object
    if events.any?
      if events.count % 10 == 1
        "#{events.count} событие"
      elsif events.count % 10 <= 4
        "#{events.count} события"
      else
        "#{events.count} событий"
      end
    else
      "Нет событий"
    end 
  end
end
