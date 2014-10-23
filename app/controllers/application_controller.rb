class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :allow_tracking

  def allow_tracking
    response.headers['X-XSS-Protection'] = '1'
  end
end
