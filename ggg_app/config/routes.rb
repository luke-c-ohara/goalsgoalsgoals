GggApp::Application.routes.draw do
  resources :teams
  resources :matches 
  
  root to: 'home#index'

  get 'home/about'

end
