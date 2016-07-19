Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'projects#index'

  resources :projects, shallow: true do
		resources :features do
			resources :requests
		end
	end



end
