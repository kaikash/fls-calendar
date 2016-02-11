class Web::User::SettingsController < Web::User::ApplicationController
  def edit
    # Костыль, почему-то .dup не копирует этот объетк
    @user = ::User.find current_user.id
  end

  def update
    # Костыль, почему-то .dup не копирует этот объетк
    @user = ::User.find current_user.id
    if @user.update(update_params)
      redirect_to user_calendar_path
    else
      render :edit
    end
  end

  def edit_password
    @user = UserUpdatePasswordForm.new
  end

  def update_password
    pars = update_password_params
    pars[:email] = current_user.email
    @user = UserUpdatePasswordForm.new pars
    if @user.save
      redirect_to user_calendar_path
    else
      render :edit_password
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :surname, :email)
  end

  def update_password_params
    params.require(:user_update_password).permit(:old_password, :new_password)
  end
end
