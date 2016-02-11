class Web::WelcomeController < Web::ApplicationController
  skip_before_filter :authenticate!
  def new
    redirect_to user_calendar_path if signed_in?
  end
end
