class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book was updated"
      redirect_to book_path(@book)
    else
      flash[:notice] = "Book was not updated"
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book was deleted"
    redirect_to book_path
  end
  private
  def set_book
    @article = Book.find(params[:id])
  end
    def book_params
      params.require(:book).permit(:name, :author, :year)
    end
end
