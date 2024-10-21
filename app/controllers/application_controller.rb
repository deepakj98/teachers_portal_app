class ApplicationController < ActionController::Base
    helper_method :current_teacher, :logged_in?
  
    def current_teacher
      @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
    end
  
    def logged_in?
      !!current_teacher
    end
  
    def require_teacher
      redirect_to login_path unless logged_in?
    end
  end
  