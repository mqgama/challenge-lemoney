require 'sidekiq/web'
Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'customer/dashboard#index'

  namespace :customer do
    resources :offers
  end

end
