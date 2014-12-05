class Department
  include Mongoid::Document
  include Mongoid::Slug
  include VotesCalculation
  
  field :name,        type: String
  field :description, type: String,  default: ''
  field :vote,        type: Integer, default: 0

  belongs_to :faculty
  has_many   :groups
  has_many   :lectors
  
  slug :name
end
