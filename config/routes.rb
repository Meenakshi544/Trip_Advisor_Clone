Rails.application.routes.draw do
  get 'admin/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "hotels#index"
  resources :hotels, only: [:index,:show] do
    resources :reviews do
      resources :usercomments
    end
  end
  #as these features are under /admin so I have not included it within resources 
  get "/admin/hotels/new", to: "hotels#new", as: :hotel_new
  post "/hotels", to: "hotels#create"
  get "hotels/admin/:id/edit", to: "hotels#edit", as: :hotel_edit
  patch "/hotels/:id", to: "hotels#update"
  delete "/hotels/:id", to: "hotels#destroy"

  #these routes are for admin approval of review
  get "hotels/:hotel_id/:id", to: "reviews#update", as: :hotel_review_approve
  patch "/hotels/:hotel_id/:id", to: "reviews#update"
  delete "/hotels/:hotel_id/reviews/:id", to: "reviews#destroy", as: :hotel_review_destroy

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'


  get "admin", to: 'admin#index'

end
