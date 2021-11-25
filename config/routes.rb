Rails.application.routes.draw do
  root             'pages#home'
  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  
  resources :users
end
