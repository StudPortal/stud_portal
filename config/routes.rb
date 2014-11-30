Rails.application.routes.draw do
  
  devise_for :users

  votes = lambda do
    collection{ get 'xlsx' }
    put :up_vote
    put :down_vote    
  end

  resources :universities do
    votes.call
    #get  "universities/xlsx" => "universities#xlsx"
    resources :faculties do
      votes.call
      #get  "faculties/xlsx" => "faculties#xlsx"
    
      resources :departments do
        votes.call
        #get  "departments/xlsx" => "departments#xlsx"
        
        resources :groups do 
          votes.call
          #get  "groups/xlsx" => "groups#xlsx"
        end
    
        resources :lectors do 
          votes.call
          #get  "lectors/xlsx" => "lectors#xlsx"
        end

      end
    
    end
  
  end

  root 'universities#welcome'
  get  'universities/welcome' => 'universities#welcome', as: :welcome
end
