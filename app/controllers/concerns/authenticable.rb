module Authenticable
  extend ActiveSupport::Concern

  included do
    include AuthHelper

    before_action :authenticate!

    helper_method :current_user, :signed_in?
  end

  def authenticate!
    raise 'must overload'
  end
end