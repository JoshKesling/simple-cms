Rails.application.routes.draw do
  get 'sections/index'

  get 'sections/show'

  get 'sections/new'

  get 'sections/edit'

  get 'sections/delete'

  root 'demo#index'
  match ':controller(/:action(/:id))', via: %i[get post]
end
