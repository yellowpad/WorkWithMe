Rails.application.routes.draw do
  get 'tags/create'

  root 'static#home'

  resources :projects do 
    resources :tags, only: [:create]
    resources :comments
  end
  resources :accounts
  get '/projects/:id/form', to: "projects#reply_form"
  get '/login', to: "sessions#new"
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"
  delete '/logout', to: "sessions#destroy"
  post '/login', to: "sessions#create"
  
  resources :categories, only: [:new, :show, :create] do 
    collection do 
      get 'autocomplete'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end