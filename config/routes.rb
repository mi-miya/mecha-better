Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy'
  
  root to: 'dynamic_pages#top'
end
