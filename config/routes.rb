Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :potato_prices, only: :index
      get '/potato_prices/best_profit', to: "potato_prices#best_profit"
    end
  end
end
