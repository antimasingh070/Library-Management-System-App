class BooksController < ApplicationController

    before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @books = Book.paginate(page: params[:page], per_page: 5)
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "Book was added successfully."
      redirect_to @book
    else
      render 'new'
    end
  end


  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :number_Of_units, :description[])
  end

  def require_same_user
    if current_user != @book.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own book"
      redirect_to @book
    end
  end

end
