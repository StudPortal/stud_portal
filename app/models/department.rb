class Department
  include Mongoid::Document
  
  field :name, type: String

  embedded_in :faculty
  embeds_many :groups
  embeds_many :lectors
end
