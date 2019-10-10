class AlbumsController < ApplicationController
	before_action :ensure_signed_in

	def index
		@albums = Album.all
		render :index
	end

	def show
		@album = Album.find_by(id: params[:id])
		if @album
			render :show
		else
			flash[:errors] = "Album not found!"
			redirect_to albums_url
		end
	end

	# Nested new route
	def new
		@album = Album.new
		# @album.band_id = params[:band_id]
		render :new
	end

	def edit
		@album = Album.find_by(id: params[:id])
		if @album
			render :edit
		else
			flash[:errors] = "Album not found!"
			redirect_to albums_url
		end
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			render :show
		else
			flash.now[:errors] = @album.errors.full_messages
			render :new
		end
	end

	def update
		@album = Album.find_by(id: params[:id])
		if @album
			if @album.update_attributes(album_params)
				render :show
			else
				flash.now[:errors] = @album.errors.full_messages
				render :edit
			end
		else
			flash[:errors] = "Album not found!"
			redirect_to albums_url
		end
	end

	def destroy
		@album = Album.find_by(id: params[:id])
		if @album
			@album.destroy
			render :show
		else
			flash[:errors] = "Album not found!"
			redirect_to albums_url
		end
	end

	private

	def album_params
		params.require(:album).permit(:title, :year, :live, :band_id)
	end
end
