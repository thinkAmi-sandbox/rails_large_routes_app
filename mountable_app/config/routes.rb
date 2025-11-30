MountableApp::Engine.routes.draw do
  concern :commentable do
    resources :comments, only: [:index, :create]
  end

  concern :attachable do
    resources :attachments, only: [:index, :create, :destroy]
  end

  resources :articles do
    collection do
      get 'search'
    end
    member do
      get 'preview'
      patch 'publish'
    end
    resources :logs, only: [:index, :create]
  end

  resources :authors, only: [:index, :show] do
    resources :profiles, only: [:show, :update]
    resources :posts, concerns: [:commentable, :attachable]
  end

  namespace :v1 do
    namespace :admin do
      resources :projects do
        resources :tasks, concerns: [:commentable]
        resources :deployments, only: [:index, :create]
      end
    end
  end

  scope defaults: { format: :json } do
    resources :reports, only: [:index, :show] do
      collection do
        get 'export'
      end
      member do
        get 'audit'
      end
    end
  end

  get '/health', to: ->(env) { [200, {}, ['ok']] }
  get '/redirect_root', to: redirect('/')
end
