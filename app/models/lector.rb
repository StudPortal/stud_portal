class Lector
  include Mongoid::Document
  
  field :name,     type: String
  field :position, type: String

  embedded_in :department
end
