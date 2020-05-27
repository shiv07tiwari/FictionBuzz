class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    if current_user
      redirect_to feed_url
    end
  end

  def create
    print params[:email]
    print params[:password]
  	user = User.find_by_email(params[:sessions][:email])
  	if user && user.authenticate(params[:sessions][:password])
  		session[:user_id] = user.id
  		redirect_to feed_url, notice: "Logged In!"
  	else
  		flash.now[:alert] = "Invalid Credentials"
  		render 'new'
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end 

end
