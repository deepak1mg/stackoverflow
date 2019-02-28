Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      resources :badges
    end
    post 'login', to: 'sessions#create'
    get 'logout', to:'sessions#destroy', as:'logout'

    resources :posts do
    	resources :comments do
  			resources :votes do
				end
        post 'votes/upvote', to: 'votes#upvote'
        post 'votes/downvote', to: 'votes#downvote'
  	      
    	end
    end
    get 'query', to: 'posts#query'
    
    get 'posts/:post_id', to: 'posts#index'
  end

end
