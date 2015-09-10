Rails.application.routes.draw do


  root :to => 'session#new'
  get '/users/followed' => 'users#followed', as: 'followed'
  get '/users/follow/:id' => 'users#follow', as: 'follow'
  get '/users/unfollow/:id' => 'users#unfollow', as: 'unfollow'
  resources :users, :pages, :posts

  get '/login' => 'session#new', as: 'login'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy', as: 'logout'
  get '/post' => 'session#create'
  get '/account' => 'pages#create'
  get '/edit/:id' => 'posts#edit', :as => 'post_edit'
  get '/delete/:id' => 'posts#destroy', :as => 'post_destroy'

end
