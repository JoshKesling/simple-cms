Rails.application.routes.draw do

  root 'demo#index'

  get 'admin', to: 'access#index'

  match ':controller(/:action(/:id))', via: %i[get post]
end
