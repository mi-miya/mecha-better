Rails.application.routes.draw do
  get 'privacy', to: "static_pages#privacy"
  get 'signin', to: "static_pages#signin"
  resources :ideas do
    resources :idea_reactions, :only => [:create]
  end
  resources :applauses, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root to: 'static_pages#top'
end
