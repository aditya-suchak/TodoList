Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "tasks#index"
  
  resources :tasks
  post "tasks/:id/check", to: "tasks#check"
end
