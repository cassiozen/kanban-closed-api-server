class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  around_filter :scope_current_authorization

  private

  def current_authorization
    authorization = Authorization.where(:key => request.headers['Authorization']).first_or_create
    authorization.touch #Updates timestamp, so we can know it was active.
    return authorization
  end
  helper_method :current_authorization

  def scope_current_authorization
    Authorization.current_id = current_authorization.id
    yield
  ensure
    Authorization.current_id = 1
  end

end
