Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      resources :badges
    end

    post 'login', to: 'sessions#create'
    get 'logout', to:'sessions#destroy', as: :logout
    resources :password_resets, only: [:create, :update]
    resources :posts do
    	member do
      	post :like , to: 'posts#upvote'
      	post :unlike, to: 'posts#downvote'
      	get :count_votes, to: 'posts#count_votes'
        post :comment_for_post, to: 'comments#comment_for_post'
        get :comment, to: 'comments#post_comments'
        #resources :comments
    	end
    	resources :answers do
        	member do
         		post :upvote , to: 'answers#upvote'
        		post :downvote, to: 'answers#downvote'
            post :comment_for_answer, to: 'comments#comment_for_answer'
            get :comment, to: 'comments#answers_comments'
            # resources :comments, only: [:index]
        	end
    	end
    end
  end
end