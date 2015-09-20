class TracksController < ApplicationController
before_action :must_be_logged_in

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:messages] = ["New track '#{@track.name}'' created"]
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def show
    @track = Track.find(params[:id])
    @track_notes = Track.includes(:notes).where("tracks.id = #{@track.id}")
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      flash[:messages] = ["Update successful"]
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:messages] = ["Deleted #{@track.name}"]
    redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics)
  end
end
