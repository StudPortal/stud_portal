class University
  include Mongoid::Document

  field :name,   type: String
  field :adress, type: String
  field :lat,    type: Float
  field :lng,    type: Float

  embeds_many :faculties
end
