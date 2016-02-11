class EventDecorator < ApplicationDecorator
  delegate_all

  def date_to_show
    object.date.strftime("%a %m/%d/%y")
  end
end
