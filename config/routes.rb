Rails.application.routes.draw do
  devise_for :users
  # resources :コントローラ名　※あとで追加
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  root :to => 'users#top'
  get 'blogs' => 'blogs#about'
  get 'home/about', to: 'books#about'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'


end

# ユーザーコントローラを作って [済]
# localhost3000://users   user一覧（index）
# usersコントローラのindexアクションを呼び出してくれる
# usersコントローラのindexアクションを作る [済]
# def index
# end

# usersのindexのviewファイルを作る
# <% link_to 'ログアウト', destroy_user_session_path %>