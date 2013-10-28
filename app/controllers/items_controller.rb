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
		item = Item.create(params[:item])
		if item.errors.empty?
			redirect_to user_path(current_user.id)
		else
			flash[:errors] = item.errors.full_messages
			redirect_to new_items_path
		end
	end

	def destroy
		Item.find(params[:id]).destroy
		# or you can do this
		# Sample.delete(params[:id])
		redirect_to user_path(current_user.id)
	end

	def getbookmark
		render 'getbookmark.html.erb' #Unnecessary, will render by default
	end

end
