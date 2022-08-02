class BooksController < ApplicationController

   #before perform action it will verify method is eligible for this action or not

   before_action :require_user, except: [:edit, :issue, :update, :destroy]
   before_action :require_librarian, except: [:issue, :index, :show ,:new ,:create , :update ,:destroy, :edit]

    def show                           #search book by their id
        @book = Book.find(params[:id])
    end
    
    def index                            #show all book list
        @books = Book.all
    end

    def new                             #it will create new books
        @book = Book.new
     end
  

   def issue                            #search by book title then issue book from the library
      @book = Book.find_by(params[:title])
      if !@number_Of_units.nil?
        flash[:notice] = "Book is already Requested!!"
      else

        flash[:notice] = "Book Added to your Requested Lists"
      end
        redirect_to action: "index"
   end
  
    def create                            #add new book 
        @book = Book.new(book_params)
  
        if @book.save
           redirect_to :action => 'index'
        else
           render :action => 'new'
        end
     end
     
     def edit                             #edit the book 
        @book = Book.find(params[:id])
     end
     
     def update                          #update the book 
        @book = Book.find(params[:id])
        
        if @book.update(book_param)
           redirect_to :action => 'show', :id => @book
        else
           render :action => 'edit'
        end
     end
     
     def destroy                           #remove book from library
        @book= Book.find(params[:id])
        @book.destroy
        redirect_to :action => 'index'
     end
     private

     def book_param
        params.require(:book).permit(:title, :number_Of_units, :description)
      end

   def require_librarian
        if !(logged_in? && current_user.librarian?)
         flash[:alert] = "Only Libraian can perform that action"
         redirect_to root_path
        end
      end
end
