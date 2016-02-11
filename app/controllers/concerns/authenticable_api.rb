module AuthenticableApi
  extend ActiveSupport::Concern
  include Authenticable

  def authenticate!
    render head: :forbidden unless signed_in?
  end
end