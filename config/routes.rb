require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'currencies#index'

  get :admin, to: 'admin/currencies#index', as: 'admin'
  patch :admin, to: 'admin/currencies#update'

  mount ActionCable.server => '/cable'
  
  mount Sidekiq::Web => '/sidekiq'
end
