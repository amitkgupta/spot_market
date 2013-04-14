SpotMarket::Application.routes.draw do
  resources :spot_prices, only: :index
end
