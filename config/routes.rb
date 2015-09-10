Rails.application.routes.draw do


  root :to => 'session#new'
  get '/users/followed' => 'users#followed', as: 'followed'
  get '/users/follow/:id' => 'users#follow', as: 'follow'
  get '/users/unfollow/:id' => 'users#unfollow', as: 'unfollow'
  resources :users, :pages, :posts

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/post' => 'session#create'
  get '/account' => 'pages#create'
  get '/edit' => 'post#edit', :as => 'post_edit'

end
