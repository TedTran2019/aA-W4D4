class NotesController < ApplicationController
	def create
		@note = Note.new(note_params)
		@note.user_id = current_user.id
		@note.save
		redirect_to track_url(@note.track_id)
	end

	def destroy
		@note = current_user.notes.find_by(id: params[:id])
		if @note
			@note.destroy
			redirect_to track_url(@note.track_id)
		else
			flash[:errors] = "FORBIDDEN"
			render text: "FORBIDDEN", status: :forbidden
		end
	end

	private

	def note_params
		params.require(:note).permit(:content, :track_id)
	end
end
