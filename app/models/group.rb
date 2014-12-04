class Group
  include Mongoid::Document
  include Mongoid::Slug
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer, default: 0

  belongs_to :department
  
  slug :name
end
