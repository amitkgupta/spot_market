SpotMarket::Application.routes.draw do
  root :to => "spot_prices#index"
  resources :spot_prices, only: :index
end
