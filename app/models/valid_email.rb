class ValidEmail < ActiveRecord::Base
  attr_accessible :checked_in_at, :email, :permissions

  validates :email, :presence => true, :email => true

  def check_in
    self.update_attributes(:checked_in_at => Time.now + 1.second)
  end
  
  def checked_in?
    if checked_in_at.nil?
      return false
    elsif checked_in_at < updated_at
      return false
    else
      return true
    end
  end

end
