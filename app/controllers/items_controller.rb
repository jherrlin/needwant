class ItemsController < ApplicationController
	include ItemsHelper

	def new
		@user = current_user
		@wishlist_id = @user.wishlist.id
		@url = params[:url]
		@image = params[:image]
		@title ||= params[:title]
		@price = @url ? get_price_from_api(@url) : params[:price]
	end

	def create
		Item.create(params[:item])
		@user_id = current_user.id
		redirect_to user_path(@user_id)
	end

	def destroy
		Item.find(params[:id]).destroy
		# or you can do this
		# Sample.delete(params[:id])
		redirect_to user_path(current_user.id)
	end

	def getbookmark
		# render 'getbookmark.html.erb'
	end

end
