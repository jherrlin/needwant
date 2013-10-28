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
      @wishlist = Wishlist.create(:user_id => @user.id)
      sign_in(@user)
    	redirect_to @user
    else
      render 'new'
    end
  end

end
