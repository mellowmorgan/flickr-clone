Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  resources :users do
    resources :galleries do
      member do
        delete :delete_image_attachment
      end
    end
  end
end
