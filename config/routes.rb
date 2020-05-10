Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :accounts, only: :create
  end
end
