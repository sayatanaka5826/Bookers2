class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])

    @user = User.new(user_params)
     if @user.save
      redirect_to user_path(@user.id)
     else
      render :show
     end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
