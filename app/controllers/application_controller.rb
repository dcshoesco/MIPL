# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :is_admin?,:is_team_owner?,:owner_team
  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def is_admin?
    session[:is_admin]
  end
  def is_team_owner?
    session[:owner_team]
  end
  def owner_team
    session[:owner_team]
  end
  def must_be_admin
    return true if is_admin?
    redirect_to :controller => "static", :action => "index"
  end
end
