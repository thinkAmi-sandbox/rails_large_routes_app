Rails.application.routes.draw do
  resources :shops do
    collection do
      get 'search'
    end
    member do
      get 'audit'
    end
  end

  namespace :backoffice do
    resources :orders do
      resources :line_items, only: [:index, :create]
    end
  end
end
