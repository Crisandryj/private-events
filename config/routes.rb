Rails.application.routes.draw do
  resources :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   root to: "events#index"

   # get '/users/:id', to: "users#show"

   devise_for :users, controllers: {
     sessions: 'users/sessions'
   }


  resources :events do
  post 'attend', on: :member
  end

  resources :events do
  post 'unattend', on: :member
  end


end
