Cloudpress::Engine.routes.draw do
  root to: 'posts#index'

  resource :archives, path: '/:year(/:month)', only: :show
  resource :posts, path: '*id', only: :show

end