module AuthHelper
  def current_user
    if signed_in? && @current_user.blank?
      @current_user = User.find_by_id(session[:user_id])
      if @current_user
        @current_user = @current_user.decorate
      else
        sign_out
      end
    end
    @current_user
  end

  def sign_out
    session.delete(:user_id)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    session[:user_id]
  end
end