Rails.application.routes.draw do
  scope :api do
    get 'exchange_rates', to: 'exchange_rates#index'
    get 'convert', to: 'convert#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
