Rails.application.routes.draw do
    
    resources :users, only: [:create] do
        collection do
            get :sign_up, action: 'new'    
        end
    end
    
    resources :sessions,path: 'users', only: [] do
        collection do
            get :sign_in, action: 'new'
            post :sign_in, action: 'create'
            delete :sign_out, action: 'destroy'
        end
    end

    resources :restaurants do
        member do
         post :pocket_list #restaurants#pocket_list
        end 
      resources :comments, shallow: true,
                             only: [:create, :destroy]
      # resources :comments, only: [:index, :new, :create]
    end
    # resources :comments, except: [:index, :new, :create]
    
    root "restaurants#index"
# get '/restaurants', to: 'restaurants#index'

# get :new_restaurant, to: 'restaurants#new'

# post '/restaurant_list', to: 'restaurants#list'
end
