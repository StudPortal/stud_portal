class University
  include Mongoid::Document
  include Mongoid::Slug
  include Geocoder::Model::Mongoid
  include VotesCalculation

  field :name,        type: String
  field :address,     type: String
  field :coordinates, type: Array
  field :vote,        type: Integer, default: 0

  has_many :faculties
  
  slug :name

  geocoded_by :address
  after_validation :geocode
end
