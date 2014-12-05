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

  navigation = lambda do
    member do 
      get 'units'
      get 'raiting'
    end    
  end

  resources :universities do
    navigation.call
    votes.call
    member{ get 'address' }

    resources :faculties do
      navigation.call
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
