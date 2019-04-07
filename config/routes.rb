Rails.application.routes.draw do

  root 'posts#index'

  # case sensitive
  get '/add' => 'posts#new',      as: 'new_parent'
  get '/*url/add' => 'posts#new', as: 'new_child'
  get '/*url' => 'posts#show',    as: 'post'

  resources :posts, only: [:index, :create, :edit, :update]
  
end
