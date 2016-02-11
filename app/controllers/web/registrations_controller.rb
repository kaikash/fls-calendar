class Web::RegistrationsController < Web::ApplicationController
  skip_before_filter :authenticate!
  def new
    @user = ::User.new
  end

  def create
    @user = ::User.create(create_params)
    if @user.save
      sign_in @user
      redirect_to user_calendar_path
    else
      render :new
    end
  end
  
  private 
  def create_params
    params.require(:user).permit(:name, :surname, :email, :password)
  end
end
