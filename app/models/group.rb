class Group
  include Mongoid::Document
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer

  belongs_to :department
end
