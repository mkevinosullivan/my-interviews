Rails.application.routes.draw do
  resources :job_postings
  resources :questionnaires
  #resources :responses
  resources :candidates
  resources :questions

  get '/interview', to: 'questions#interview'
  get '/job_postings/:id/select_candidates', to: 'job_postings#select_candidates', as: 'select_candidates'
  post '/job_postings/:id/set_candidates', to: 'job_postings#set_candidates', as: 'set_candidates'
  post '/responses', to: 'responses#create'
  get '/responses/list', to: 'responses#list', as: 'list_responses'

  root to: 'job_postings#index'
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
