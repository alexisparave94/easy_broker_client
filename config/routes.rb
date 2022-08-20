Rails.application.routes.draw do
  root "properties#index"
  resources :properties, only: %i[index show]

  post '/contact' => 'contacts#create'
end
