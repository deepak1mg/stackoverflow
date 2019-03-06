Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      resources :badges
    end

    post 'login', to: 'sessions#create'
    get 'logout', to:'sessions#destroy', as: :logout

    resources :posts do
    	member do
      	post :like , to: 'posts#upvote'
      	post :unlike, to: 'posts#downvote'
      	get :count_votes, to: 'posts#count_votes'
    	end
    	resources :comments
    	resources :answers do
        	member do
         		post :upvote , to: 'answers#upvote'
        		post :downvote, to: 'answers#downvote'
        	end
        	resources :comments
    	end
    end
  end
end