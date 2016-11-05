Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :companies do
    resources :reviews
  end

	devise_for :users, controllers: { confirmations: 'confirmations' }
end
