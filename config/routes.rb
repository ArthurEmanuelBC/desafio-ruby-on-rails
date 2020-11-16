# frozen_string_literal: true

Rails.application.routes.draw do
  get 'stores', to: 'stores#index'
  get 'cnabs', to: 'cnabs#index'
  post 'cnabs', to: 'cnabs#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
