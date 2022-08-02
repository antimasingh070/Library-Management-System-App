class SessionsController < ApplicationController
    def new
    end
  
    def create                 #create session for user & authenticate them by their email & password
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to user
      else
        flash.now[:alert] = "There was something wrong with your login details"
        render 'new'
      end
    end
  
    def destroy                 #to logout from user's account
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to root_path
    end
end
