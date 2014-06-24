Rainforest::Application.routes.draw do
  resources :products
  resources :users, :only => [:new, :create]
end
