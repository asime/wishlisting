class WishlistItem < ActiveRecord::Base
  belongs_to :charities
  has_many :images
  attr_accessible :description, :item, :charity_id, :goal
  
  def progressAgainstGoal
	  @donations = Donation.find_all_by_wishlist_item_id(id)
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
  
  def remainingAgainstGoal
    @goal = 0
    if !goal.nil?
      @goal = goal
    end
    @remaining = @goal - progressAgainstGoal
    if @remaining < 0
      @remaining = 0
    end
    return @remaining
  end
  
  def percentAgainstGoal
    @goal = 0
    if !goal.nil?
      @goal = goal
    end
    if @goal > 0
      @percent = (progressAgainstGoal/@goal) * 100
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
    if !goal.nil?
      @goal = goal
    end
    if @goal > 0
      @degrees = (progressAgainstGoal/@goal) * 360
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
