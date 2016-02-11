module AuthenticableWeb
  extend ActiveSupport::Concern
  include Authenticable

  def authenticate!
    redirect_to new_session_path unless signed_in?
  end
end