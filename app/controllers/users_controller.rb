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
    @user = current_user
    @book = Book.new
    
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to '/books'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
