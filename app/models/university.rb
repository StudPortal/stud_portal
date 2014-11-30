class University
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  include VotesCalculation

  field :name,        type: String
  field :address,     type: String
  field :coordinates, type: Array
  field :vote,        type: Integer

  has_many :faculties

  geocoded_by :address
  after_validation :geocode
end
