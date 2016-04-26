Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lunch_roulette_groups, only: [:index]
    end
  end
  
  root   'home#index'
  get    '/auth/slack',              as: :slack_login
  get    'auth/slack/callback',      to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy',            as: :logout
  get    '/user_groups',             to: 'user_groups#index',           as: 'user_groups'
  resources :user_groups, only: [:index, :show]
  resources :slack_users, only: [:index, :destroy]
  resources :restaurant_recommendations, only: [:index]
  post   'food_preferences',         to: 'food_preferences#update'
  get    '/lunch_roulette_groups',   to: 'lunch_roulette_groups#index', as: 'lunch_roulette_groups', formats: {default: :json}
  get    '/:username',               to: 'users#show',                  as: 'user'
  get    '/:username/edit',          to: 'users#edit',                  as: 'edit_user'
  patch  '/:username',               to: 'users#update'
end
