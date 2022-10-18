class BooksController < ApplicationController

  def top
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end



  def index
    @book = Book.new
    @books = Book.all
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
  @book = Book.find(params[:id])  # データ（レコード）を1件取得
  @book.destroy  # データ（レコード）を削除
  redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end