class Faculty
  include Mongoid::Document
  
  field :name, type: String

  belongs_to :university
  has_many :departments
end
