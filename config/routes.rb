Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :admin do
    resources :orders, only:[:show,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :items, except:[:destroy]
    resources :order_detail, only:[:update]
    root to: 'homes#top'
  end

  scope module: :public do
    resources :addresses, except:[:new,:show]
    resources :orders, only:[:new,:create,:index,:show]
    get 'orders/thanks', as: "thanks"
    post 'orders/confirm', as: "confirm"
    resources :cart_items, only:[:index,:update,:destroy,:create]
    delete 'cart_items/destroy_all', as: "destroy_all"
    resources :customers, only:[:show,:edit,:update]
    get 'customers/unsubscribe', as: "unsubscribe"
    patch 'customers/withdraw', as: "withdraw"
    resources :items, only:[:index,:show]
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
