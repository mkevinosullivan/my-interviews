Rails.application.routes.draw do
  resources :questionnaires
  resources :responses
  resources :candidates
  resources :questions
  
  get '/interview', to: 'questions#interview'

  root to: 'candidates#index'
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
