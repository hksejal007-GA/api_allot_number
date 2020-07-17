Rails.application.routes.draw do
  post '/phones', to: 'phone_numbers#create', defaults: {format: :json}
  post '/phones/:number', to: 'phone_numbers#create', defaults: {format: :json}
  get '/phones', to: 'phone_numbers#index', defaults: {format: :json}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
