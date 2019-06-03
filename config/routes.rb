Rails.application.routes.draw do
	resources :users, only: [:new, :create, :index, :show]
  post '/auth/login', to: 'authentication#login'
end
