class Charity < ActiveRecord::Base
  attr_accessible :about, :charity_name, :contact_name, :email, :login, :password, :dts_url, :short_name, :total_goal

  validates_uniqueness_of :short_name, :case_sensitive => false
  
  def progressAgainstTotal
	  @donations = Donation.find_all_by_charity_id(id)
	  @progress = 0
	  if @donations.nil?
	    return @progress
	  else
	    @donations.each do |d|
		    if (!d.amount.nil? && d.processed)
		      @progress += d.amount
		    end
	    end
	  end
	  return @progress
  end
  
  def remainingAgainstTotal
    @goal = 0
    if !total_goal.nil?
      @goal = total_goal
    end
    return @goal - progressAgainstTotal
  end
  
  def percentAgainstTotal
    @goal = 0
    if !total_goal.nil?
      @goal = total_goal
    end
    if @goal > 0
      return (progressAgainstTotal/@goal) * 100
    else
      return 0
    end
  end
  
  def degreesProgress
    @goal = 0
    if !total_goal.nil?
      @goal = total_goal
    end
    if @goal > 0
      return (progressAgainstTotal/@goal) * 360
    else
      return 0
    end
  end
  
  def degreesRemaining
    360-degreesProgress
  end
  
end
