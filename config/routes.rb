Cloudpress::Engine.routes.draw do
  get '/authorize', to: 'cloudpress/authorization#create'
  root to: 'cloudpress/posts#index'
end