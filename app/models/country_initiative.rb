class CountryInitiative < ActiveRecord::Base
  attr_accessible :country_id, :initiative_id, :join_date

  belongs_to :country
  belongs_to :initiative

  validate :valid_date

  private

    def valid_date
      errors.add('Join Date', 'must be later than 1961') unless join_date > '1963-01-01'.to_date
    end  

    def do_before_validation
      self.join_date = join_date.to_date
    end  

end
