Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :ideas do
    resources :idea_reactions, :only => [:create]
    resources :idea_developers, :only => [:create, :update, :destroy]
    get :tasks
  end
  resources :applauses, only: [:create, :destroy]

  root to: "static_pages#top"
  get 'logout',  to: "sessions#destroy"
  get 'signin',  to: "static_pages#signin"
  get 'sitemap', to: "static_pages#sitemap"
  get 'privacy', to: "static_pages#privacy"
  get 'terms', to: "static_pages#terms"
  get 'auth/:provider/callback', to: 'sessions#create'
end
