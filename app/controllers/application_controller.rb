class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, with: :handle_error
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_error
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  protected
  def handle_error(exception = nil)
    logger.info "Rendering 404: #{exception ? exception.message : ''}: " + params.inspect
    render :file => "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end
end
