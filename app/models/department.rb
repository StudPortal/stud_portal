class Department
  include Mongoid::Document
  
  field :name, type: String

  belongs_to :faculty
  has_many   :groups
  has_many   :lectors
end
