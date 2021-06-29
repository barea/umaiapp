Rails.application.routes.draw do
  resources :weathers do 
      collection do
      get 'export'
    end
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
