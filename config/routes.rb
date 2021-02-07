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

  resources :coordinators
  resources :interiors, only: [:index, :new, :show, :edit, :destroy]
  resources :tops, only: [:index, :edit]
  resources :favorites, only: [:create, :destroy]

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end