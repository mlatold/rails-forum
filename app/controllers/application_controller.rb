class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init
  include ApplicationHelper



  private

    def init
      I18n.locale = params[:locale] || I18n.default_locale
      @breadcrumbs = [{:title => "RailsForum", :url => root_path}]

      # New session
      if session[:user_id] == nil
        session[:user_id] = 0
      end
    end

end
