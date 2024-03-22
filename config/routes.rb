Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  mount Sidekiq::Web => '/admin/sidekiq'
  get '/coins/download', to: 'coins#download'
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
