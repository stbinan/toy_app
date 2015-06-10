class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to My Toy App <3"
      redirect_to @user # @user == user_url(@user)
    else
      render 'new'
    end
    #@user = User.create(user_params)
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :avatar)
  end
end
