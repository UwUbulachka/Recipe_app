Rails.application.routes.draw do
  root             'pages#home'
  get 'about'   => 'pages#about'
  get 'my_feed' => 'pages#my_feed'
  get 'contact' => 'pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users do 
    member do 
      get :following, :followers
    end  
  end
  resources :posts
  resources :categories
  resources :relationships, only: [:create, :destroy]

end
