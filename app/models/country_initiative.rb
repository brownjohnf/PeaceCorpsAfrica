class CountryInitiative < ActiveRecord::Base
  attr_accessible :country_id, :initiative_id, :join_date, :country_url, :initiative_url

  belongs_to :country
  belongs_to :initiative

  validates :country_id, :initiative_id, :presence => true
  validates :country_url, :initiative_url, :url => true, :allow_blank => true
  validates :join_date, :date => true, :allow_blank => true

  private

    def do_before_validation
      self.join_date = join_date.to_date
    end  

end
