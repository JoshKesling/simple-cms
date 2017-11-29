Rails.application.routes.draw do
  root 'demo#index'
  match ':controller(/:action(/:id))', via: %i[get post]
end
