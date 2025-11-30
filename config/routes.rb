Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount MountableApp::Engine => '/mountable_app'
  mount MountableSecondApp::Engine => '/mountable_second_app'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'blogs#index'

  # HTTP Verb Constraints
  # multiple HTTP method
  # https://guides.rubyonrails.org/routing.html#http-verb-constraints
  match '/multiple_match', to: 'multiple#call', via: [:get, :post]

  # Resource Routing
  # https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
  resources :apples

  # Singular Resources
  # https://guides.rubyonrails.org/routing.html#singular-resources
  resource :icon

  # Nested Resources
  # https://guides.rubyonrails.org/routing.html#nested-resources
  resources :blogs do
    resources :posts, module: :blogs do
      resources :comments, module: :posts
    end

    # Controller Namespaces and Routing
    # https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing
    namespace :forum, module: :blogs do
      resources :categories, only: :index, module: :forums
    end
  end

  # Shallow Nesting
  # https://guides.rubyonrails.org/routing.html#shallow-nesting
  # 4 actions edit, show, update, and destroy with id shorten the URL pattern
  # (parents disappear from the URL).
  resources :parents, shallow: true do
    resources :children
  end

  # Routing Concerns
  # https://guides.rubyonrails.org/routing.html#routing-concerns
  concern :image_attachable do
    resources :images, only: :index
  end
  resources :news, concerns: :image_attachable, only: :index

  concern :bulk_commentable do
    resources :comments, only: [:index, :create] do
      member do
        get 'audit'
      end
    end
  end

  concern :bulk_attachable do
    resources :attachments, only: [:index, :create, :destroy]
  end

  # Adding Member Routes
  # https://guides.rubyonrails.org/routing.html#adding-member-routes
  resources :reports, only: :index do
    member do
      get 'preview'
    end
  end

  # Adding Collection Routes
  # https://guides.rubyonrails.org/routing.html#adding-collection-routes
  resources :movies, only: :index do
    collection do
      get 'search'
    end
  end


  # Adding Routes for Additional New Actions
  # https://guides.rubyonrails.org/routing.html#adding-routes-for-additional-new-actions
  resources :assignments, only: :index do
    get 'draft', on: :new
  end


  # Redirection
  # https://guides.rubyonrails.org/routing.html#redirection
  get '/redirect', to: redirect('/blogs')


  # Segment Constraints
  # https://guides.rubyonrails.org/routing.html#segment-constraints
  get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }
  get 'videos/:id', to: 'videos#show', id: /[A-Z]\d{5}/

  # inline route
  # https://guides.rubyonrails.org/routing.html#routing-to-rack-applications
  get '/inline', to: ->(env) { [204, {}, ['']] }


  # Routing to Rack Applications
  # https://guides.rubyonrails.org/routing.html#routing-to-rack-applications
  match '/rack_app', to: HelloRackApp.new, via: :all


  # Direct routes
  # https://guides.rubyonrails.org/routing.html#direct-routes
  # => Not visible in rails routes
  direct :hatena_blog do
    'https://thinkami.hatenablog.com/'
  end


  # Unknown (Not Resourceful)
  # https://guides.rubyonrails.org/routing.html#non-resourceful-routes
  get '/unknown', to: 'unknown#show'
  get '/videos/unknown', to: 'videos#unknown'

  # Bulk route catalog for performance measurement (static listing, no metaprogramming)
  namespace :bulk do
    # Top-level repeated resources with member/collection routes and nested logs
    resources :items_001 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_002 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_003 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_004 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_005 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_006 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_007 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_008 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_009 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_010 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_011 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_012 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_013 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_014 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_015 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_016 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_017 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_018 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_019 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_020 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_021 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_022 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_023 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_024 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_025 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_026 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_027 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_028 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_029 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_030 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_031 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_032 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_033 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_034 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_035 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_036 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_037 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_038 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_039 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_040 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_041 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_042 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_043 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_044 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_045 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_046 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_047 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_048 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_049 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_050 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_051 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_052 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_053 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_054 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_055 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_056 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_057 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_058 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_059 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_060 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_061 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_062 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_063 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_064 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_065 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_066 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_067 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_068 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_069 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_070 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_071 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_072 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_073 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_074 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_075 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_076 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_077 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_078 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_079 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_080 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_081 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_082 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_083 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_084 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_085 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_086 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_087 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_088 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_089 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_090 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_091 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_092 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_093 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_094 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_095 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_096 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_097 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_098 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_099 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_100 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_101 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_102 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_103 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_104 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_105 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_106 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_107 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_108 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_109 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_110 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_111 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_112 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_113 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_114 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_115 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_116 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_117 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_118 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_119 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_120 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_121 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_122 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_123 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_124 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_125 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_126 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_127 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_128 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_129 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_130 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_131 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_132 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_133 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_134 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_135 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_136 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_137 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_138 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_139 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_140 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_141 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_142 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_143 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_144 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_145 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_146 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_147 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_148 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_149 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_150 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_151 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_152 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_153 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_154 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_155 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_156 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_157 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_158 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_159 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_160 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_161 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_162 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_163 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_164 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_165 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_166 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_167 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_168 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_169 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_170 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_171 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_172 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_173 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_174 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_175 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_176 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_177 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_178 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_179 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_180 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_181 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_182 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_183 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_184 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_185 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_186 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_187 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_188 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_189 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_190 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_191 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_192 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_193 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_194 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_195 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_196 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_197 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_198 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_199 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_200 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_201 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_202 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_203 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_204 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_205 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_206 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_207 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_208 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_209 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_210 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_211 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_212 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_213 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_214 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_215 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_216 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_217 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_218 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_219 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_220 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_221 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_222 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_223 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_224 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_225 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_226 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_227 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_228 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_229 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_230 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_231 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_232 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_233 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_234 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_235 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_236 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_237 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_238 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_239 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_240 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_241 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_242 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_243 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_244 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_245 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_246 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_247 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_248 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_249 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_250 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_251 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_252 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_253 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_254 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_255 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_256 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_257 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_258 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_259 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_260 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_261 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_262 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_263 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_264 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_265 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_266 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_267 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_268 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_269 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_270 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_271 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_272 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_273 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_274 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_275 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_276 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_277 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_278 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_279 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_280 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_281 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_282 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_283 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_284 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_285 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_286 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_287 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_288 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_289 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_290 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_291 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_292 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_293 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_294 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_295 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_296 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_297 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_298 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_299 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_300 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_301 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_302 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_303 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_304 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_305 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_306 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_307 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_308 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_309 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_310 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_311 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_312 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_313 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_314 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_315 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_316 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_317 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_318 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_319 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_320 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_321 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_322 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_323 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_324 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_325 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_326 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_327 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_328 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_329 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_330 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_331 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_332 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_333 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_334 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_335 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_336 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_337 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_338 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_339 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_340 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_341 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_342 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_343 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_344 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_345 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_346 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_347 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_348 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_349 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_350 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_351 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_352 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_353 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_354 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_355 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_356 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_357 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_358 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_359 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_360 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_361 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_362 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_363 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_364 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_365 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_366 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_367 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_368 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_369 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_370 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_371 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_372 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_373 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_374 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_375 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_376 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_377 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_378 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_379 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_380 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_381 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_382 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_383 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_384 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_385 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_386 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_387 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_388 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_389 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_390 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_391 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_392 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_393 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_394 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_395 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_396 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_397 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_398 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_399 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_400 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_401 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_402 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_403 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_404 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_405 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_406 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_407 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_408 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_409 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_410 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_411 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_412 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_413 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_414 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_415 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_416 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_417 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_418 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_419 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_420 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_421 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_422 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_423 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_424 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_425 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_426 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_427 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_428 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_429 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_430 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_431 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_432 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_433 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_434 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_435 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_436 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_437 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_438 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_439 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_440 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_441 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_442 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_443 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_444 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_445 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_446 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_447 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_448 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_449 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_450 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_451 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_452 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_453 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_454 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_455 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_456 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_457 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_458 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_459 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_460 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_461 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_462 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_463 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_464 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_465 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_466 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_467 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_468 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_469 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_470 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_471 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_472 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_473 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_474 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_475 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_476 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_477 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_478 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_479 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_480 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_481 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_482 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_483 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_484 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_485 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_486 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_487 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_488 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_489 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_490 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_491 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_492 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_493 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_494 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_495 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_496 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_497 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_498 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_499 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_500 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_501 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_502 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_503 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_504 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_505 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_506 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_507 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_508 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_509 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_510 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_511 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_512 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_513 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_514 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_515 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_516 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_517 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_518 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_519 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_520 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_521 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_522 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_523 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_524 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_525 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_526 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_527 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_528 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_529 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_530 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_531 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_532 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_533 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_534 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_535 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_536 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_537 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_538 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_539 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_540 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_541 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_542 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_543 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_544 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_545 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_546 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_547 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_548 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_549 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_550 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_551 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_552 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_553 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_554 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_555 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_556 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_557 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_558 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_559 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_560 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_561 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_562 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_563 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_564 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_565 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_566 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_567 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_568 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_569 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_570 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_571 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_572 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_573 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_574 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_575 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_576 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_577 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_578 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_579 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_580 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_581 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_582 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_583 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_584 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_585 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_586 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_587 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_588 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_589 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_590 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_591 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_592 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_593 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_594 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_595 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_596 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_597 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_598 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_599 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_600 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_601 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_602 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_603 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_604 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_605 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_606 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_607 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_608 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_609 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_610 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_611 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_612 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_613 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_614 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_615 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_616 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_617 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_618 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_619 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_620 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_621 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_622 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_623 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_624 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_625 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_626 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_627 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_628 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_629 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_630 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_631 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_632 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_633 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_634 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_635 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_636 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_637 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_638 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_639 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_640 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_641 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_642 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_643 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_644 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_645 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_646 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_647 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_648 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_649 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_650 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_651 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_652 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_653 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_654 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_655 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_656 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_657 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_658 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_659 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_660 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_661 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_662 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_663 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_664 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_665 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_666 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_667 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_668 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_669 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_670 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_671 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_672 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_673 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_674 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_675 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_676 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_677 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_678 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_679 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_680 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_681 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_682 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_683 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_684 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_685 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_686 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_687 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_688 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_689 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_690 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_691 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_692 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_693 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_694 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_695 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_696 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_697 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_698 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_699 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_700 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_701 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_702 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_703 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_704 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_705 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_706 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_707 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_708 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_709 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_710 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_711 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_712 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_713 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_714 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_715 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_716 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_717 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_718 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_719 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_720 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_721 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_722 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_723 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_724 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_725 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_726 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_727 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_728 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_729 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_730 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_731 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_732 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_733 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_734 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_735 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_736 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_737 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_738 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_739 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_740 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_741 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_742 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_743 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_744 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_745 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_746 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_747 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_748 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_749 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_750 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_751 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_752 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_753 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_754 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_755 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_756 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_757 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_758 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_759 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_760 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_761 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_762 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_763 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_764 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_765 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_766 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_767 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_768 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_769 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_770 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_771 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_772 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_773 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_774 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_775 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_776 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_777 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_778 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_779 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_780 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_781 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_782 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_783 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_784 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_785 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_786 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_787 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_788 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_789 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_790 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_791 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_792 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_793 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_794 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_795 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_796 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_797 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_798 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_799 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_800 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_801 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_802 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_803 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_804 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_805 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_806 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_807 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_808 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_809 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_810 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_811 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_812 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_813 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_814 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_815 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_816 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_817 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_818 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_819 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_820 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_821 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_822 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_823 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_824 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_825 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_826 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_827 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_828 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_829 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_830 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_831 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_832 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_833 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_834 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_835 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_836 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_837 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_838 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_839 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_840 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_841 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_842 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_843 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_844 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_845 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_846 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_847 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_848 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_849 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_850 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_851 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_852 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_853 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_854 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_855 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_856 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_857 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_858 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_859 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_860 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_861 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_862 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_863 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_864 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_865 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_866 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_867 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_868 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_869 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_870 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_871 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_872 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_873 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_874 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_875 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_876 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_877 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_878 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_879 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_880 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_881 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_882 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_883 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_884 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_885 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_886 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_887 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_888 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_889 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_890 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_891 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_892 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_893 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_894 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_895 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_896 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_897 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_898 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_899 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_900 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_901 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_902 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_903 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_904 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_905 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_906 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_907 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_908 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_909 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_910 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_911 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_912 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_913 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_914 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_915 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_916 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_917 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_918 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_919 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_920 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_921 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_922 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_923 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_924 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_925 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_926 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_927 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_928 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_929 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_930 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_931 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_932 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_933 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_934 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_935 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_936 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_937 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_938 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_939 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_940 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_941 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_942 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_943 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_944 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_945 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_946 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_947 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_948 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_949 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_950 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_951 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_952 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_953 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_954 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_955 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_956 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_957 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_958 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_959 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_960 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_961 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_962 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_963 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_964 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_965 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_966 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_967 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_968 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_969 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_970 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_971 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_972 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_973 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_974 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_975 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_976 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_977 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_978 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_979 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_980 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_981 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_982 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_983 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_984 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_985 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_986 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_987 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_988 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_989 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_990 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_991 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_992 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_993 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_994 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_995 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_996 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_997 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_998 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_999 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1000 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1001 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1002 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1003 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1004 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1005 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1006 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1007 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1008 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1009 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1010 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1011 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1012 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1013 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1014 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1015 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1016 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1017 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1018 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1019 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    resources :items_1020 do
      collection do
        get 'search'
        post 'bulk_import'
      end
      member do
        get 'audit'
        patch 'toggle'
      end
      resources :logs, only: [:index, :create]
    end

    # Deeply nested namespaces with constraints/defaults
    namespace :v1 do
      namespace :admin do
        namespace :north do
          resources :projects do
            resources :tasks, concerns: [:bulk_commentable, :bulk_attachable]
            resources :milestones, only: [:index, :show]
          end
        end

        namespace :south do
          resources :projects do
            resources :tasks, concerns: [:bulk_commentable]
            resources :releases, only: [:index, :show, :create]
          end
        end

        namespace :east do
          resources :projects do
            resources :tasks, concerns: [:bulk_attachable]
            resources :incidents, only: [:index, :create, :update]
          end
        end
      end
    end

    constraints subdomain: /api|admin/ do
      scope '/files' do
        get 'archive/*path', to: 'archives#show'
        get ':year/:month/:day/:slug', to: 'archives#dated', constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
        post ':year/:month/:day/:slug', to: 'archives#create', constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
      end
    end

    scope defaults: { format: :json } do
      resources :reports, only: [:index, :show] do
        collection do
          get 'export'
          get 'summary/:year', to: 'reports#summary', constraints: { year: /\d{4}/ }
        end
        member do
          get 'audit'
        end
      end
    end

    scope module: :ops do
      scope '/regions/:region_id' do
        resources :teams, only: [:index, :show] do
          resources :members, only: [:index, :show, :create]
          resources :rotations, only: [:index, :create, :destroy]
        end
      end
    end

    # Route bundles for redirect, rack apps, and non-resourceful samples
    get '/status/ping', to: redirect('/up')
    get '/status/short', to: redirect('/bulk/status/ping')
    get '/status/edge', to: redirect('/bulk/items_001')
    get '/status/delayed', to: ->(env) { [202, {}, ['accepted']] }
    match '/status/all', to: ->(env) { [200, {}, ['ok']] }, via: :all

    get '/files/*path', to: 'files#show'
    get '/legacy/:section/:page', to: 'legacy#show'
    get '/deep/:country/:city/:district/:street', to: 'maps#show'

    constraints format: /html|json/ do
      get '/format/example/:id', to: 'formats#show', id: /\d+/
      post '/format/example/:id', to: 'formats#create', id: /\d+/
    end

    scope '/aliases' do
      get '/a/:id', to: 'aliases#a'
      get '/b/:id', to: 'aliases#b'
      get '/c/:id', to: 'aliases#c'
      get '/d/:id', to: 'aliases#d'
      get '/e/:id', to: 'aliases#e'
      get '/f/:id', to: 'aliases#f'
      get '/g/:id', to: 'aliases#g'
      get '/h/:id', to: 'aliases#h'
      get '/i/:id', to: 'aliases#i'
      get '/j/:id', to: 'aliases#j'
    end

    namespace :v2 do
      resources :organizations do
        scope '/users/:user_id' do
          resources :profiles, only: [:index, :show, :update]
          resources :keys, only: [:index, :create, :destroy]
        end

        resources :departments do
          resources :employees, concerns: [:bulk_commentable]
          resources :expenses, concerns: [:bulk_attachable]
        end
      end
    end

    # Additional single resources to add volume and shape variety
    resource :dashboard, only: [:show] do
      member do
        get 'overview'
        get 'health'
      end
    end

    resource :profile, only: [:show, :update] do
      member do
        get 'preferences'
        patch 'preferences'
      end
    end

    resource :flag, only: [:create, :destroy]
    resource :setting, only: [:show, :update]
    resource :toggle, only: [:update]
  end

end
