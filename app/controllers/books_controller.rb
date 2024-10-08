class BooksController < ApplicationController
  def index
    @books = Book.all.where(archived: false).order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      reder :edit, status: unprocessable_entity
    end
  end

  def destroy
    @book = Book.all.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  def archive
    @book = Book.find(params[:id])
    @book.update(archived: true)

    redirect_to root_path, status: :see_other
  end

  def archived
    @books = Book.all.where(archived: true).order(:title)
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :year, :old, :archived)
    end
end
