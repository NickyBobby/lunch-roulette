Rails.application.routes.draw do
  root   'home#index'
  get    '/auth/slack',         as: :slack_login
  get    'auth/slack/callback', to: 'sessions#create'
  get    '/:username',          to: 'users#show',       as: 'user'
  get    '/:username/edit',     to: 'users#edit',       as: 'edit_user'
  patch  '/:username',          to: 'users#update'
  delete '/logout',             to: 'sessions#destroy', as: :logout
end
