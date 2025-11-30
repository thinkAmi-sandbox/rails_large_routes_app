MountableSecondApp::Engine.routes.draw do
  resources :reviews do
    member do
      get 'summary'
      patch 'publish'
    end
  end

  resources :products do
    resources :ratings, only: [:index, :create]
    resources :questions, only: [:index, :create]
  end

  namespace :internal do
    resources :audits, only: [:index, :show]
  end

  match '/status', to: ->(env) { [200, {}, ['ok']] }, via: :all
end
