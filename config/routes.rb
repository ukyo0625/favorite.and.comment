Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  root :to  => 'home#top'
  root 'post_images#index'
  get 'home/about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
