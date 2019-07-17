Rails.application.routes.draw do
  resources :ideas, only: [:index, :show, :new, :create] do
    resources :idea_reactions, :only => [:create]
  end
  resources :applauses, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root to: 'dynamic_pages#top'
end
