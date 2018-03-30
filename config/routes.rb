Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  get '/machines', to: 'machines#index'
  post '/machines/:code', to: 'machines#update'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
