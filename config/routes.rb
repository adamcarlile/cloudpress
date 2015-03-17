Cloudpress::Engine.routes.draw do

  resource :archives, path: '/:year(/:month)', only: :show
  resources :tags, only: :show  
  
  root to: 'posts#index'
  get '*slug', to: 'posts#show', as: :post

end