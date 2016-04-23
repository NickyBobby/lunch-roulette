Rails.application.routes.draw do
  root   'home#index'
  get    '/auth/slack',              as: :slack_login
  get    'auth/slack/callback',      to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy',            as: :logout
  get    '/user_groups',             to: 'user_groups#index',           as: 'user_groups'
  delete '/user_groups/delete',      to: 'slack_users#destroy',         as: 'delete_slack_user'
  get    '/lunch_roulette_groups',   to: 'lunch_roulette_groups#index', as: 'lunch_roulette_groups'
  get    '/:user_group/slack_users', to: 'slack_users#index',           as: 'slack_users'
  get    '/:username',               to: 'users#show',                  as: 'user'
  get    '/:username/edit',          to: 'users#edit',                  as: 'edit_user'
  patch  '/:username',               to: 'users#update'
end
