Rails.application.routes.draw do

  root 'posts#index'

  get '/add',       to: 'posts#new',   as: 'new_parent'
  get '/*url/add',  to: 'posts#new',   as: 'new_child'
  get '/*url/edit', to: 'posts#edit',  as: 'edit_post'
  get '/*url',      to: 'posts#show',  as: 'post'
  patch '/*url',    to: 'posts#update'
  put '/*url',      to: 'posts#update'

  resources :posts, only: [:index, :create]
  
end
