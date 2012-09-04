class CountryInitiative < ActiveRecord::Base
  attr_accessible :country_id, :initiative_id, :join_date

  belongs_to :country
  belongs_to :initiative

  validates :country_id, :initiative_id, :presence => true
  validate :valid_date, :unless => 'join_date.blank?'

  private

    def valid_date
      if join_date < '1961-01-01'.to_date
        errors.add(:join_date, 'must be later than Jan 1, 1961')
      elsif join_date > Date.today
        errors.add(:join_date, "must not be in the future: that just doesn't make sense!")
      end
    end  

    def do_before_validation
      self.join_date = join_date.to_date
    end  

end
