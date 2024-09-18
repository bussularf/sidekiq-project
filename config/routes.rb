Rails.application.routes.draw do
  get "emails/new"
  get "emails/create"
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [ :new, :create ]

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  post "send_report", to: "reports#send_report"

  get "send_email", to: "emails#new"
  post "send_email", to: "emails#create"
  root "emails#new"
end
