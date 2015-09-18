class BandsController < ApplicationController
before_action :must_be_logged_in
  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
  end

  def edit
    @band = Band.find(params[:id])
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      flash.now[:messages] = ["Update successful"]
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash[:messages] = ["Deleted #{@band.name}"]
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
