class TracksController < ApplicationController
	before_action :ensure_signed_in

	def index
		@tracks = Track.all
		render :index
	end

	def show
		@track = Track.find_by(id: params[:id])
		if @track
			render :show
		else
			flash[:errors] = "Track not found!"
			redirect_to tracks_url
		end
	end

	def new
		@track = Track.new
		render :new
	end

	def edit
		@track = Track.find_by(id: params[:id])
		if @track
			render :edit
		else
			flash[:errors] = "Track not found!"
			redirect_to tracks_url
		end
	end

	def create
		@track = Track.new(track_params)
		if @track.save
			redirect_to track_url(@track)
		else
			flash.now[:errors] = @track.errors.full_messages
			render :new
		end
	end

	def update
		@track = Track.find_by(id: params[:id])
		if @track
			if @track.update_attributes(track_params)
				render :show
			else
				flash.now[:errors] = @track.errors.full_messages
				render :edit
			end
		else
			flash[:errors] = "Track not found!"
			redirect_to tracks_url
		end
	end

	def destroy
		@track = Track.find_by(id: params[:id])
		if @track
			@track.destroy
			render :show
		else
			flash[:errors] = "Track not found!"
			redirect_to tracks_url
		end
	end

	private

	def track_params
		params.require(:track).permit(:album_id, :title, :ord, :lyrics, :bonus)
	end
end
