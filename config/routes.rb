Cloudpress::Engine.routes.draw do
  root to: 'cloudpress/posts#index'

  resource :archives, path: '/:year(/:month)', only: :show
  resource :posts, path: '*id', only: :show
  
end