class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.all
    render json: { status: 'Success', message: 'Books loaded', data: @books }, status: :ok
  end

  def show
    render json: { status: 'Success', message: 'Book found', data: @book }, status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: { status: 'Success', message: 'Book created', data: @book }, status: :created
    else
      render json: { status: 'Error', message: 'Book not created', data: @book.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: { status: 'Success', message: 'Book updated', data: @book }, status: :ok
    else
      render json: { status: 'Error', message: 'Book not updated', data: @book.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    render json: { status: 'Success', message: 'Book deleted', data: @book }, status: :ok
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :year )
  end
      
end
