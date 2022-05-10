# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

resources :sessions, only: %i[new create]
resources :users, only: %i[new create]
resources :images, only: %i[create index]
delete 'sessions', to: 'sessions#destroy', as: :session
get '/search', to: 'images#search'
