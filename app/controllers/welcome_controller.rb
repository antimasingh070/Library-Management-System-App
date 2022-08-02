class WelcomeController < ApplicationController

    #this is the home page 
    
    def home
        redirect_to books_path if logged_in?
    end

end
