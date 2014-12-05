class Group
  include Mongoid::Document
  include Mongoid::Slug
  include VotesCalculation
  
  field :name,        type: String
  field :description, type: String,  default: ''
  field :vote,        type: Integer, default: 0

  belongs_to :department
  
  slug :name
end
