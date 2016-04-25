Rails.application.routes.draw do
  root   'home#index'
  get    '/auth/slack',              as: :slack_login
  get    'auth/slack/callback',      to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy',            as: :logout
  get    '/user_groups',             to: 'user_groups#index',           as: 'user_groups'
  resources :user_groups, only: [:index, :show]
  resources :slack_users, only: [:index, :destroy]
  resources :restaurant_recommendations, only: [:index]
  get    '/lunch_roulette_groups',   to: 'lunch_roulette_groups#index', as: 'lunch_roulette_groups', formats: {default: :json}
  get    '/:username',               to: 'users#show',                  as: 'user'
  get    '/:username/edit',          to: 'users#edit',                  as: 'edit_user'
  patch  '/:username',               to: 'users#update'
end
