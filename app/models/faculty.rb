class Faculty
  include Mongoid::Document
  include Mongoid::Slug
  include VotesCalculation
  
  field :name, type: String
  field :vote, type: Integer, default: 0

  belongs_to :university
  has_many   :departments
  
  slug :name
end
