class UsersController < ApplicationController
	skip_before_action :logged_in?, only: [:new, :create, :change_password, :reset_password]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
    	set_user_session(@user) 
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def change_password
  	@user= User.new
  end

  def reset_password
  	user = User.find_by(email: params[:email], security_question: params[:security_question])
  	if user
  		render 'reset_password'
  	else
  			flash.now.alert = "Invalid email or security answer"
  			render 'change_password'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email,:password, :password_confirmation,:security_question)
  end
end
