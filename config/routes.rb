Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quiz, only: [:new, :create] do
    member do
      get 'question'
    end
  end

  resources :answer, only: [:create] do
    collection do
      get 'results'
    end
  end

  root to: 'quiz#question'

  get '*path' => redirect('/')
end
