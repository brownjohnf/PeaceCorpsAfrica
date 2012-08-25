class CountryInitiative < ActiveRecord::Base
  attr_accessible :country_id, :initiative_id, :join_date
  attr_accessor :enable

  belongs_to :country
  belongs_to :initiative

  validates :year, :presence => true

end
