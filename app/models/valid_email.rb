class ValidEmail < ActiveRecord::Base
  attr_accessible :checked_in_at, :email, :permissions

  validates :email, :presence => true, :email => true

  def check_in
    self.update_attributes(:checked_in_at => Time.now)
  end
  
  def checked_in?
    !checked_in_at.nil?

  end

end
