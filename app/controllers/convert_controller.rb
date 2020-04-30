class ConvertController < ApplicationController
  before_action :validate_params, only: [:index]

  # GET /rates
  def index
    @converted_amount = Money.new(params[:amount].to_f, params[:from_currency]).exchange_to(params[:to_currency]).to_f
    @rates = Rate.find_all_by_from_currecny(params[:from_currency], params[:to_currency]).take(7)
  end

  private

    def validate_params
      rquired_currencies = Rails.configuration.x.all_currencies

      unless params[:amount].present? and
        params[:from_currency].present? and
        params[:to_currency].present? and
        params_include?(:from_currency, rquired_currencies) and
        params_include?(:to_currency, rquired_currencies)
          return render json: {status: "error", code: 400, message: 'invalid paramters'}, status: 400
      end
    end

    def params_include?(key, values)
      !params.key?(key) || values.include?(params[key])
    end
end
