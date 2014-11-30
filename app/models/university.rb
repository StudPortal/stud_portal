class University
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name,      type: String
  field :address,   type: String

  field :coordinates, type: Array

  has_many :faculties

  geocoded_by :address
  after_validation :geocode
end
