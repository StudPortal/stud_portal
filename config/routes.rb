Rails.application.routes.draw do
  
  devise_for :users

  votes = lambda do
    collection do 
      get 'xlsx'
      get 'pdf'
    end
    put :up_vote
    put :down_vote    
  end

  resources :universities do
    votes.call

    member do 
      get 'address'
      get 'units'
      get 'raiting'
    end

    resources :faculties do
      votes.call

      resources :departments do
        votes.call

        resources :groups do 
          votes.call
        end
    
        resources :lectors do 
          votes.call
        end

      end
    
    end
  
  end

  root 'universities#welcome'
  get  'universities/welcome' => 'universities#welcome', as: :welcome
end
