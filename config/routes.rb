Loudius::Application.routes.draw do
  get 'login' => 'sessions#new'
  get 'reg' => 'users#new'

  root 'home#index'
end