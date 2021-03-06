# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: %i[show create]
      resources :teas, only: [:create]
      resources :subscriptions, only: [:create]
      patch '/subscriptions', to: 'subscriptions#update'
    end
  end
end
