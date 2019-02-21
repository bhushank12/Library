class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def index_for_library_users
    @library = Library.find(params[:library_id])
    @users = @library.users.all
  end
end
