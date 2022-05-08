class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:city] && params[:city] != ""
      @flats = Flat.search_by_location(params[:city])
    else
      @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @flat = Flat.find(params[:id])
    @markers = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to(@flat, notice: "New flat successfully listed")
    else
      render :new
    end
  end

  def miami_beach
    @beach_flats = Flat.where(address: 'Miami Beach')
  end

  def coral_gables
    @gables_flats = Flat.where(address: 'Coral Gables')
  end

  def brickell
    @brickell_flats = Flat.where(address: 'Brickell')
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :dates, :price, :description, :photo)
  end
end
