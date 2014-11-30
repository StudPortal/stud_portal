Rails.application.routes.draw do
  
  devise_for :users

  votes = lambda do
    put :up_vote
    put :down_vote    
  end

  resources :universities do
    votes.call
    
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

  root 'universities#index'

end
