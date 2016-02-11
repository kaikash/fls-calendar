class Web::SessionsController < Web::ApplicationController
  skip_before_filter :authenticate!

  def new
    redirect_to user_calendar_path if signed_in?
    @session = UserForm.new
  end

  def create
    @session = UserForm.new session_params
    if @session.valid?
      sign_in @session.user
      redirect_to user_calendar_path
    else
      render :new
    end 
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
