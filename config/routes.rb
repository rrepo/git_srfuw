Rails.application.routes.draw do
  devise_for :users
  root    'sorfuw#index'
  get     'sorfuw'         => 'sorfuw#index'
  get     'sorfuw/new'     => 'sorfuw#new'
  get     'sorfuw/situmon' =>'sorfuw#situmon'
  post    'sorfuw'         =>'sorfuw#create'
  get     'users/:id'     =>'users#show' 
  delete  'sorfuw/:id'     =>'sorfuw#destroy'
  get     'sorfuw/:id/edit'=>'sorfuw#edit'
  patch   'sorfuw/:id'     =>'sorfuw#update'
  get     'sorfuw/:id'     =>'sorfuw#show'
  # post    'sorfuw/:id'     =>'comments#create'
  resources :sorfuw
  resources :users, only: [:show]
  resources :sorfuw do
    resources :comments, only: [:create]
  end
end
# phpアドミン起動
# sudo service httpd start
# mysql起動
# sudo service mysqld start
# テストサーバー起動
# rails s -p $PORT -b $IP
# clr+cでサーバーシャットダウン