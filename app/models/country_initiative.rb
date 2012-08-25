class CountryInitiative < ActiveRecord::Base
  attr_accessible :country_id, :initiative_id, :join_date

  belongs_to :country
  belongs_to :initiative

  validates :join_date, :presence => true

  private

    def do_before_validation
      self.join_date = join_date.to_date
    end  

end
