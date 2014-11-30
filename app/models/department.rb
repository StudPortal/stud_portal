class Department
  include Mongoid::Document
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer, default: 0

  belongs_to :faculty
  has_many   :groups
  has_many   :lectors
end
