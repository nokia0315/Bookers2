class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
   @user = User.find(params[:id])
   @users = User.all
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end