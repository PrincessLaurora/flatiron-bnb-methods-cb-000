class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations


  validates_presence_of :address, :listing_type, :title, :description, :price, :neighborhood_id


  def average_review
    ratings = []
      self.reservations.each do |res|
      ratings << res.review.rating
   end

   ratings.sum.to_f / ratings.size
  end



end
