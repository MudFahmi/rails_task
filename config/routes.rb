Rails.application.routes.draw do

	namespace 'api' do

      resources :products do
      	get 'search', on: :collection
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
