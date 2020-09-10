Rails.application.routes.draw do
  get '/projects', to: 'project#index'
  patch '/projects/:id/todo/:id', to: 'project#update'
  post '/todos', to: 'project#create'
end
