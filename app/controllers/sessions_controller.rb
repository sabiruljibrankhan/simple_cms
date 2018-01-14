class SessionsController < ApplicationController
	skip_before_action :logged_in?, only: [:new, :create]
  def new	
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      set_user_session(user)
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end



	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end



end
