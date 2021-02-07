Rails.application.routes.draw do
  get 'interiors/index'
  get 'interiors/new'
  get 'interiors/show'
  get 'interiors/edit'
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
  resources :interiors
  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end