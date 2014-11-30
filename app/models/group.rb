class Group
  include Mongoid::Document
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer, default: 0

  belongs_to :department
end
