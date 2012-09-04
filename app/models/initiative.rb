class Initiative < ActiveRecord::Base
  
  attr_accessible :name, :num_volunteers, :page_id, :start_date, :contact_email, :site_url, :donate_url, :country_initiatives_attributes, :abbreviation, :num_total_volunteers

  # requires name, start_date, abbreviation
  validates :name, :start_date, :abbreviation, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :abbreviation, :length => { :minimum => 2, :maximum => 16 }, :uniqueness => true
  validates :name, :uniqueness => true
  validates :num_volunteers, :length => { :maximum => 4 }
  validate :valid_date, :unless => 'start_date.blank?'

  before_validation :do_before_validation
  before_save :do_before_save

  has_many :country_initiatives, :dependent => :destroy
  has_many :countries, :through => :country_initiatives

  accepts_nested_attributes_for :country_initiatives, :allow_destroy => true

  default_scope :order => 'name ASC'

  def to_param
    abbreviation.downcase
  end

  private

    def valid_date
      errors.add('Start Date', 'must be later than 1961') unless start_date > '1961-01-01'.to_date
    end

    def do_before_validation
      self.start_date = start_date.to_date unless start_date.blank?
    end

    def do_before_save
      self.abbreviation = abbreviation.upcase
    end

end
