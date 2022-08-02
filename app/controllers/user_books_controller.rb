class UserBooksController < ApplicationController
    def create                #Assign perticuler book for specific user
        @user_book = UserBook.create(user: current_user, book: book)
        flash[:notice] = "Book #{book.title} was successfully added to your account"
        redirect_to root_path
      end
    
      def destroy                    #remove book from user's account
        book = Book.find(params[:id])
        user_book = UserBook.where(user_id: current_user.id, book_id: book.id).first
        user_book.destroy
        flash[:notice] = "#{book.title} was successfully removed from account"
        redirect_to root_path
      end
end
