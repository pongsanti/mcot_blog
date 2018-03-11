Rails.application.routes.draw do
  scope 'mcot' do
    get 'welcome/index'

    resources :articles

    root 'welcome#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
