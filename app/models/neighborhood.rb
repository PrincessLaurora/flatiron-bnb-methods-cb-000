class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :listings
  has_many :reservations, :through => :listings

  include Methods::InstanceMethods
  extend Methods::ClassMethods


end
