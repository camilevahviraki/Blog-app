Rails.application.routes.draw do
  root "login#index"
  post "/", to: "login#posts"
  post "/comments", to: "login#comments"
  get "/users", to: "users#index"
  get 'users/:user_id/posts', to: 'posts#index'
  get 'users/:user_id/posts/:id', to: 'posts#show'
  get 'users/:id', to: 'users#show'
end
