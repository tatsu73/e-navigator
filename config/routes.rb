Rails.application.routes.draw do

  root 'users#index'
  get 'profile' => 'users#profile'
  patch 'edit' => 'users#edit'
  get 'new' => 'interview#new'
  patch 'make' => 'interview#make'
  get 'interview' => 'interview#index'
  patch 'reply' => 'interview#reply'
  patch 'delete' => 'interview#delete'

  devise_for :users
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
