class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def render_404
        render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
    end
    
    def render_500
        render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
    end
  
    private
  
    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
  
    def logged_in?
        !!session[:user_id]
    end
  
    def authenticate
        return if logged_in?
        redirect_to root_path, alert: 'ログインしてください'
    end
  end