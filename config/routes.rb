Needwant::Application.routes.draw do
 
  root  to: 'users#new'

  get '/help' => 'users#help'
  get '/signup' =>  'users#new'

  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  delete '/signout' => 'sessions#destroy'

  delete '/items/:id', to: 'items#destroy'

  get '/getbookmark' => 'items#getbookmark' 

  resources :users
  resources :sessions, only: [:new, :create]
  resources :wishlists

  resources :items

 
 
end
