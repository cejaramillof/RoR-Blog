Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'faq', to: 'welcome#faq'
  get 'terms', to: 'welcome#terms'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'
end
