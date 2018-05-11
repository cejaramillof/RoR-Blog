Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :categories
  resources :posts do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  put "comments/:id/read", to: "comments#read", :as => :read_comment
  put "comments/:id/unread", to: "comments#unread", :as => :unread_comment

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'faq', to: 'welcome#faq'
  get 'terms', to: 'welcome#terms'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'
  get 'ready', to: 'welcome#ready'
end
