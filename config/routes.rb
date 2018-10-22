Rails.application.routes.draw do
  devise_for :users
  root    'srfuw#index'
  get     'srfuw'         => 'srfuw#index'
  get     'srfuw/new'     => 'srfuw#new'
  get     'srfuw/situmon' =>'srfuw#situmon'
  post    'srfuw'         =>'srfuw#create'
  get     'users/:id'     =>'users#show' 
  delete  'srfuw/:id'     =>'srfuw#destroy'
  get     'srfuw/:id/edit'=>'srfuw#edit'
  patch   'srfuw/:id'     =>'srfuw#update'
  get     'srfuw/:id'     =>'srfuw#show'
  resources :srfuw
  resources :users, only: [:show]
  resources :srfuw do
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