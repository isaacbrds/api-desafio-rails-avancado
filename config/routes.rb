Rails.application.routes.draw do
  resources :clientes
  root 'home#index'
  post 'administradores/login', to: 'administradores#login'
  #mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
end
