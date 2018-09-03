Rails.application.routes.draw do
  get 'users/new'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'static_pages#home'
	get '/help', to: 'static_pages#help'
	get '/about', to: 'static_pages#about'
	get '/littletest', to: 'static_pages#littletest'
	get 'static_pages/testing'
	get '/contact', to: 'static_pages#contact'
	get '/signup', to: 'users#new'
	get '/signup2', to: 'users#newanother'
	post '/signup',  to: 'users#create'
	post 'signup2', to: 'users#create2'
	resources :users
end
