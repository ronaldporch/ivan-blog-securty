Blog2::Application.routes.draw do

  resources :posts
  resources :comments
  resources :replies

  root :to => 'posts#index'

end

