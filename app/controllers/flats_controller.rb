class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat= Flat.find(params[:id])
  end

  def new
    @flat = flat.new
  end

    def create
      @flat = Flat.new(flat_params)
      if @flat.save
        redirect_to(@flat, notice: "New flat successfully listed")
      else
        render :new
      end
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :address, :dates, :price, :description) # not sure if it works.
    end

end
