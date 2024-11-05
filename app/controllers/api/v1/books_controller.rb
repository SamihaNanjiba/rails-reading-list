class Api::V1::BooksController < ApplicationController
  before_action :set_api_v1_book, only: %i[ show edit update destroy ]

  # GET /api/v1/books or /api/v1/books.json
  def index
    @api_v1_books = Api::V1::Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @api_v1_books }
      format.json { render json: @api_v1_books }
    end
  end

  # GET /api/v1/books/1 or /api/v1/books/1.json
  def show
    set_api_v1_book

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @api_v1_book }
      format.json { render json: @api_v1_book }
    end
  end

  # GET /api/v1/books/new
  def new
    @api_v1_book = Api::V1::Book.new
  end

  # GET /api/v1/books/1/edit
  def edit
  end

  # POST /api/v1/books or /api/v1/books.json
  def create
    @api_v1_book = Api::V1::Book.new(api_v1_book_params)

    respond_to do |format|
      if @api_v1_book.save
        format.html { redirect_to @api_v1_book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/books/1 or /api/v1/books/1.json
  def update
    respond_to do |format|
      if @api_v1_book.update(api_v1_book_params)
        format.html { redirect_to @api_v1_book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/books/1 or /api/v1/books/1.json
  def destroy
    @api_v1_book.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def archive
    set_api_v1_book.update(archived: true)

    respond_to do |format|
      if @api_v1_book.update(api_v1_book_params)
        format.html { redirect_to api_v1_books_path, notice: "Book was successfully archived." }
        format.json { render :index, status: :see_other, location: @api_v1_books }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @api_v1_book.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to api_v1_books_path status: :see_other
  end

  def archived
    @api_v1_books = Api::V1::Book.all.where(archived: true).order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @api_v1_books }
      format.json { render json: @api_v1_books }
    end
  end

  def unarchive
    set_api_v1_book.update(archived: false)

    respond_to do |format|
      if @api_v1_book.update(api_v1_book_params)
        format.html { redirect_to api_v1_books_path, notice: "Book was successfully archived." }
        format.json { render :index, status: :see_other, location: @api_v1_books }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @api_v1_book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_book
      @api_v1_book = Api::V1::Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_book_params
      params.require(:api_v1_book).permit(:title, :author, :description, :publication_year, :archived, :old)
    end
end
