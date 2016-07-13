Rails.application.routes.draw do
	#resources :events
	resources :events do
		resources :attendees, :controller => 'event_attendees'
		resource :location, :controller => 'event_locations'

		collection do
		    get :latest
		    post :bulk_delete
		    post :bulk_update
		end
		member do
		    get :dashboard
		end		
	end	
	resources :people
	get "welcome/say_hello" => "welcome#say"
	get "welcome" => "welcome#index"

	root :to => "welcome#index"
	#match ':controller(/:action(/:id(.:format)))', :via => :all
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
