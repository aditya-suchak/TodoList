Rails.application.routes.draw do
  root "tasks#index"
  
  resources :tasks
  post "tasks/:id/check", to: "tasks#check"
end
