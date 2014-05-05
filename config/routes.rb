Rails.application.routes.draw do
  
  devise_for :users

  # will be handled by angular app. 
  # namespace :static do 
  #   get 'home',     to: 'home#index'
  #   get 'about',    to: 'home#about'
  #   get 'support',  to: 'home#help'
  # end
  # 

  namespace :api, default: :json do 
    namespace :v1 do

      get :search,        to: 'places#search'

      get 'guides/:slug',  to:  'guides#show'

      resources :users do

        get :places,      to: 'users/places#index'
        get :hotspots,    to: 'users/hotspots#index'
        get :guides,      to: 'users/guides#index'

        member do 
          get :home, to:  'users#dashboard'
        end
      end

      # 
      resource :favorites do 
        post :places,     to: 'favorites/places#create'
        post :hotspots,   to: 'favorites/hotspots#create'
        post :guides,     to: 'favorites/guides#create'

        member do 
          get :home, to:  'users#dashboard'
        end

      end


    end
  end
end
