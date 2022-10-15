Rails.application.routes.draw do
  resource :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   root to: "events#index"
   resources :join

   Rails.application.routes.draw do
     devise_for :users, controllers: {
       sessions: 'users/sessions'
     }
   end


end
