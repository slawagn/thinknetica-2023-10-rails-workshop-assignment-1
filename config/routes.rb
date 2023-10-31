Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  # root "posts#index"

  resources :payments, only: %i[create] do
    collection do
      get :successful_payment
      get :failed_payment
    end
  end
end
