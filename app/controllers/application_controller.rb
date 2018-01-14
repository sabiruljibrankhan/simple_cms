class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?

	before_action :logged_in?, except: [:current_user, :set_user_session]

	def logged_in?
		if !current_user
			redirect_to log_in_path
		end
	end

	def set_user_session(user)
		session[:user_id] = user.id
	end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
