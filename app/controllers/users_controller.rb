class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
    @wishlists = @user.wishlist
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to your wantlist!"
    	redirect_to @user
    else
      render 'new'
    end
  end

  # private
 
  #   def user_params
  #     params.require(:user).permit(:name, :email, :password,
  #                                  :password_confirmation)
  #   end
end