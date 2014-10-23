GggApp::Application.routes.draw do
  resources :teams
  resources :matches do
    collection do
      get 'results'
    end
  end 
  
  root to: 'home#index'

  get 'home/about'
  
  get '/predictions', to: 'home#predictions'


end
