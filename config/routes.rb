Rails.application.routes.draw do
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static_pages#top"
  get '/botton', to: "static_pages#botton"
  get  '/good', to: "static_pages#good"
  get  '/bad', to: "static_pages#bad"
  resources :posts, only: %i[new create]
end
