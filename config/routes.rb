Rails.application.routes.draw do
  resources :ideas do
    resources :idea_reactions, :only => [:create]
  end
  resources :applauses, only: [:create, :destroy]

  root to: "static_pages#top"
  get 'logout',  to: "sessions#destroy"
  get 'signin',  to: "static_pages#signin"
  get 'sitemap', to: "static_pages#sitemap"
  get 'privacy', to: "static_pages#privacy"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root to: 'static_pages#top'
end
