Rails.application.routes.draw do
  resources :clientes
  root 'home#index'
  post 'administradores/login', to: 'administradores#login'
end
