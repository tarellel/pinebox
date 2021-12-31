# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Require the person hitting this page ot be an application admin
  authenticate :user, -> (user) { user.admin? } do
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#welcome'
end
