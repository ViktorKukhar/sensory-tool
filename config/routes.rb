Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :templates, only: [:new, :create] do
    resources :questions, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create, :index, :show] do
    resources :answers, only: [:new, :create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "sessions#index"
end
