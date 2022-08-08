Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots, only: [:index]
  # get '/plots', to: 'plots#index'
  resources :gardens, only: [:show]
  # get '/gardens/:id' to: 'gardens#show'


  delete '/plot_plants/:plot_id/:plant_id', to: 'plot_plants#destroy'
end

