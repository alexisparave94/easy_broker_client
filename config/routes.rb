Rails.application.routes.draw do
  root "properties#index"
  resources :properties, only: %i[index]
end
