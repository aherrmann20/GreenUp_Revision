class User < ActiveRecord::Base
	has_many :trips
	has_many :trees
	has_many :pledges
  belongs_to :event, :class_name => 'Event'

  def total(carbon_or_km)
    self.trips.pluck(carbon_or_km).inject{ |sum,x| sum + x }
  end

  def total_donation
    self.trees.pluck(:rand_given).inject{ |sum,x| sum + x }
  end

  def pledges_summary
    self.pledges.pluck(:about).join(" | ")
  end
end
