Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  '/card_form',          to: 'static_pages#card_form'
  post '/charge',          to: 'static_pages#charge'
end
