Rails.application.routes.draw do
  
	resources :projects, shallow: true do
		resources :features do
			resources :requests
		end
	end

end
