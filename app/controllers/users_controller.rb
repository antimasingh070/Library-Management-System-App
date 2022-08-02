class UsersController < ApplicationController

  #before performing action it will verify method is eligible for this action or not

    before_action :set_user, only: [:show, :issue]
    before_action :require_user, except: [:edit, :new]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    
    def show                      #Here we can see the user profile by entering their first name
      @books = User.all
    end
 
    def index                      #it will all the users list 
      @users = User.all
    end
 
    def new                         #to create new user profile
      @user = User.new
    end
  
    def edit                        #edit the user's profile by entering their id
      @user = User.find(params[:id])
   end
  
    def update                      #User or librarian can update user's profile
      if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
  
    def create                        #create account
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to the LMS App #{@user.first_name}, you have successfully signed up"
        redirect_to books_path
      else
        render 'new'
      end
    end
  
    def destroy                      #delete account
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all associated books successfully deleted"
      redirect_to books_path
    end
  
    private
    def user_params
      params.require(:user).permit(:first_name, :email, :password)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def require_same_user
      if current_user != @user && !current_user.librarian?
        flash[:alert] = "You can only edit or delete your own account"
      end
    end
end
