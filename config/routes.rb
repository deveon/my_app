Rails.application.routes.draw do
#  resources :comments
  get 'static_pages/home'
  root to: "static_pages#home"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" } 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :comments, module: :users
  end  
  get '/users/:id', to: 'users/users#show', as: 'user'
end
