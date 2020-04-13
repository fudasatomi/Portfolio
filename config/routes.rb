Rails.application.routes.draw do
  get 'procedures/new'
  get 'procedures/edit'
  get 'materials/new'
  get 'materials/edit'
  get 'details/new'
  devise_for :users

  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:index, :show ,:edit ,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
   collection do
     get 'leave'
     get 'follow'
   end
   member do
     get 'favorite'
   end
   end

   resources :recipes do
    member do
      get 'category_index'
      get 'detail_new'
      post 'detail_create'
    end
    resource :materials, only:[:create,:new,:edit ,:update,:destroy]
    resource :procedures, only:[:create,:new,:edit ,:update,:destroy]
    resource :favorites, only:[:create,:destroy]
    resource :comments, only:[:create, :destroy]
  end

    get 'search' => 'search#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
