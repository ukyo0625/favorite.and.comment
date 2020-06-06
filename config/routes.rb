Rails.application.routes.draw do
  devise_for :users
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :users
  root :to  => 'home#top'
  root 'post_images#index'
  get 'home/about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
