Rails.application.routes.draw do
  resources :responses
  resources :candidates
  resources :questions
  
  root to: 'candidates#index'
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
