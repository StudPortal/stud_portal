class Faculty
  include Mongoid::Document
  
  field :name, type: String

  embedded_in :university
  embeds_many :departments
end
