class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def add_breadcrumb(title, url=nil)
    @breadcrumbs ||= []
    @breadcrumbs << {:title => title, :url => url}
  end
end
