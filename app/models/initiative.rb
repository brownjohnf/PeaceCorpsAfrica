class Initiative < ActiveRecord::Base
  rolify
  
  attr_accessible :name, :num_volunteers, :page_id, :start_date, :contact_email, :site_url, :donate_url, :country_initiatives_attributes

  validates :name, :start_date, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :num_volunteers, :length => { :maximum => 4 }
  validate :valid_date

  before_validation :do_before_validation

  has_many :country_initiatives, :dependent => :destroy
  has_many :countries, :through => :country_initiatives

  accepts_nested_attributes_for :country_initiatives, :allow_destroy => true

  default_scope :order => 'name ASC'

  private

    def valid_date
      errors.add('Start Date', 'must be later than 1961') unless start_date > '1961-01-01'.to_date
    end

    def do_before_validation
      self.start_date = start_date.to_date
    end

end
