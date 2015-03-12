Rails.application.routes.draw do
  root 'home#index'

  resource :stocks, defaults: { format: 'json' } do
    post 'info'
    post 'historical'
  end

  resources :positions, defaults: { format: 'json' }

end
