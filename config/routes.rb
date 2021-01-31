Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  resources :scripts
  get 'download_output_file', to: "scripts#download_output_file"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
