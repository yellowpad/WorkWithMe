Rails.application.routes.draw do


  get 'subscriptions/create'

  get 'tags/create'

  root 'static#home'

  resources :projects do
    resources :tags, only: [:create]
    resources :skills, only: [:create]
    resources :comments
    resources :jobs, only: [:index, :new, :create, :show]

    post '/like', to: 'likes#like'
    post '/dislike', to: 'likes#dislike'
  end

  resources :accounts do
    resources :subscriptions, only: [:create, :destroy]
    resources :brainsmarts, only: [:create]
  end

  resources :subscriptions, only: [:show, :index]

  get '/projects/:id/form', to: "projects#reply_form"
  get '/login', to: "sessions#new"
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"
  delete '/logout', to: "sessions#destroy"
  get '/logout', to: "sessions#destroy"
  post '/login', to: "sessions#create"
  resources :categories, only: [:new, :show, :create] do
    collection do
      get 'autocomplete'
    end
  end

  resources :skills, only: [:new, :show, :create] do
    collection do
      get 'autocomplete'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
