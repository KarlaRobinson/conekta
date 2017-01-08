Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  '/credit_form',          to: 'static_pages#credit_form'
  post '/credit',          to: 'static_pages#credit'
  get  '/spei_form',          to: 'static_pages#spei_form'
  post '/spei',          to: 'static_pages#spei'
  get  '/cash_form',          to: 'static_pages#cash_form'
  post '/cash',          to: 'static_pages#cash'
  get  '/banorte_form',          to: 'static_pages#banorte_form'
  post '/banorte',          to: 'static_pages#banorte'
end
