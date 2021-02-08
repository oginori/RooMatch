Rails.application.routes.draw do

  devise_for :residents, controllers: {
    sessions: 'residents/sessions',
    passwords: 'residents/passwords',
    registrations: 'residents/registrations'
  }
  
  devise_for :coordinators, controllers: {
    sessions: 'coordinators/sessions',
    passwords: 'coordinators/passwords',
    registrations: 'coordinators/registrations'
  }

  resources :residents
  resources :coordinators
  resources :requests
  resources :interiors
  resources :contracts, only: [:index, :create, :edit, :update]
  resources :tops, only: [:index, :edit, :update]
  resources :favorites, only: [:index, :create, :destroy]

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end