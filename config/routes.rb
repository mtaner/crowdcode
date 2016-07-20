Rails.application.routes.draw do

  root to: 'projects#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :projects, shallow: true do
		resources :features do
			resources :requests
		end
	end



end
