Rails.application.routes.draw do

  devise_for :users

  # root to: '/projects#index'

	resources :projects, shallow: true do
		resources :features do
			resources :requests
		end
	end

end
