Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get 'most_revenue', to: 'revenue#show'
      end
      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoice#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
