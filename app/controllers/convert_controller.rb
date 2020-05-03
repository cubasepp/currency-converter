class ConvertController < ApplicationController
  before_action :validate_params, only: [:index]

  def index
    @converted_amount = Money.new(params[:cents].to_i, params[:from_currency]).exchange_to(params[:to_currency]).to_f
    @exchange_rates = ExchangeRate.find_all_by_from_to_currency(params[:from_currency], params[:to_currency]).take(7)
  end

  private

    def validate_params
      unless params[:cents].present? and
        allowed_currencies?(:from_currency) and
        allowed_currencies?(:to_currency)
          return render json: {status: "error", code: 400, message: 'invalid paramters'}, status: 400
      end
    end

    def allowed_currencies?(key)
      not params.key?(key) or Rails.configuration.x.all_currencies.include?(params[key])
    end
end
