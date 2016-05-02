Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lunch_roulette_groups, only: [:index]
      post '/restaurant_recommendations', to: 'restaurant_recommendations#index'
      post '/food_preferences',           to: 'food_preferences#update'
    end
  end

  root   'home#index'
  get    '/auth/slack',              as: :slack_login
  get    'auth/slack/callback',      to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy',            as: :logout
  get    '/user_groups',             to: 'user_groups#index',           as: 'user_groups'
  resources :user_groups, only: [:index, :show]
  resources :slack_users, only: [:index]
  get    '/slack_users/remove/:id',  to: 'slack_users#destroy'
  get    '/slack_users/add/:id',     to: 'slack_users#update'
  get    '/lunch_roulette_groups',   to: 'lunch_roulette_groups#index', as: 'lunch_roulette_groups', formats: {default: :json}
  get    '/:username',               to: 'users#show',                  as: 'user'
  get    '/:username/edit',          to: 'users#edit',                  as: 'edit_user'
  patch  '/:username',               to: 'users#update'
end
