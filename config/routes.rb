Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      resources :badges
    end

    post 'login', to: 'sessions#create'
    get 'logout', to:'sessions#destroy', as: :logout

    resources :posts do
    	resources :comments do
       resources :votes, only: [:index] do
        collection do
          post :upvote
          post :downvote
        end
       end
    	end
    end
  end
end
