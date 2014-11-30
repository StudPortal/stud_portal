class Faculty
  include Mongoid::Document
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer

  belongs_to :university
  has_many :departments
end
