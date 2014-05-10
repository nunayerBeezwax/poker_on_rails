Poker::Application.routes.draw do
 root to: 'home#index'
  resources :tables  
  resources :players
end
