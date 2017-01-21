Rails.application.routes.draw do
  	devise_for :users
	root "dashboard#index"
	resources :students, only: [:index]

end
