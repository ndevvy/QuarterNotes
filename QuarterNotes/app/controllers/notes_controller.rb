class NotesController < ApplicationController
  before_action :must_be_logged_in

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:messages] = ["New note created"]
      redirect_to track_url(@note.track_id)
    else
      flash.now[:errors] = @note.errors.full_messages
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.user_id = current_user.id
      @note.destroy
      flash[:messages] = ["Deleted note"]
      redirect_to track_url(@note.track)
    else
      render text: "nice try, putz!", status: 403
    end
  end

  private

  def note_params
    params.require(:note).permit(:name, :track_id, :body)
  end

end
