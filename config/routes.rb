Rails.application.routes.draw do
  get 'businesses/new'
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers, :followingz 
    end
  end
  
 # resources :businesses do
    
#  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :businesses do
    
    member do
      get :followerzs
    end
    
    resources :experiences, except: [:index, :show]
   collection do
      get 'search'
    end
  end


  resources :reviews,         only:   [:create, :destroy]
  resources :relationships,   only:   [:create, :destroy]
  resources :relationshipzs,  only:   [:create, :destroy]
  
end