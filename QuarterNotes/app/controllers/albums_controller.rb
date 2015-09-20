
class AlbumsController < ApplicationController
before_action :must_be_logged_in

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:messages] = ["New album '#{@album.name}'' created"]
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
    @album_with_tracks = Album.includes(:tracks).where("albums.id = #{@album.id}")
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:messages] = ["Update successful"]
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to album_url(@album)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:messages] = ["Deleted #{@album.name}"]
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id)
  end

end
