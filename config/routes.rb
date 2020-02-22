Rails.application.routes.draw do
    devise_for :users
    root to: 'pages#dashboard'

    get 'wellbeing', to: 'pages#wellbeing'
    get 'behaviour', to: 'pages#behaviour'
    get 'budget', to: 'pages#budget'
    get 'rse', to: 'pages#rse'
    get 'profil', to: 'pages#profil'
    get 'favorites', to: 'pages#favorites'
    get 'addfavorite', to: 'pages#addfavorite'
    post 'sendmail', to: 'pages#sendmail'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reports, only: %i[new create index destroy]
  post 'import',to:'reports#import'
end
