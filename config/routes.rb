Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end

  namespace :api do
    resources :users, only: %i[index show] do
      namespace :v1 do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[new create]
        end 
      end 
    end  
  end
end
