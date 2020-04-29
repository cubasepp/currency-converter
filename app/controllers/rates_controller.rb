class RatesController < ApplicationController

  # GET /rates
  def index
    @rates = Rate.all

    render json: @rates
  end

end
