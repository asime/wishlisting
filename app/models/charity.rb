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
    @remaining = @goal - progressAgainstTotal
    if @remaining < 0
      @remaining = 0
    end
    return @remaining
  end
  
  def percentAgainstTotal
    @goal = 0
    if !total_goal.nil?
      @goal = total_goal
    end
    if @goal > 0
      @percent = (progressAgainstTotal/@goal) * 100
      if @percent > 100
        return 100
      else
        return @percent
      end
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
      @degrees = (progressAgainstTotal/@goal) * 360
      if @degrees > 360
        return 360
      else
        return @degrees
      end
    else
      return 0
    end
  end
  
  def degreesRemaining
    360-degreesProgress
  end
  
end
