Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  namespace :post do
    resources :comments
  end
  get 'news', to: 'news#main'
  devise_for :users, :controllers => {registrations: 'registrations'}
  get 'users/:id' => 'users#show', as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#homepage'
  get 'homepage', to: 'home#homepage'
  resource :connections, only: [:create, :destroy]
end
