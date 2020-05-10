Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :accounts, only: :create
    resources :tokens, path: '/singup', only: :create
    resources :transfers, only: :create

    get '/accounts/balance', to: 'accounts#balance'
  end
end
