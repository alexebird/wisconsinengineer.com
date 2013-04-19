# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private

  def current_user
    @_current_user ||= session[:current_user_id] && User.first(session[:current_user_id])
  end

  def admin_required
    redirect_to new_session_path unless current_user
  end
end
