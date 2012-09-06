class Initiative < ActiveRecord::Base
  
  attr_accessible :name, :page_id, :start_date, :contact_email, :site_url, :donate_url, :country_initiatives_attributes, :abbreviation

  # requires name, start_date, abbreviation
  validates :name, :abbreviation, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :abbreviation, :length => { :minimum => 3, :maximum => 7 }, :uniqueness => true, :alphanumeric => true
  validates :name, :uniqueness => true
  validates :contact_email, :email => true, :allow_blank => true
  validates :page_id, :numericality => { :only_integer => true }, :allow_blank => true
  validates :start_date, :date => true
  validates :donate_url, :site_url, :url => true, :allow_blank => true

  before_validation :do_before_validation
  before_save :do_before_save

  has_many :country_initiatives, :dependent => :destroy
  has_many :countries, :through => :country_initiatives

  accepts_nested_attributes_for :country_initiatives, :allow_destroy => true

  default_scope :order => 'name ASC'

  def initiative_url_for(country)
    country_initiatives.find_by_country_id(country.id).initiative_url
  end

  def to_param
    abbreviation.downcase
  end

  private

    def do_before_validation
      self.start_date = start_date.to_date unless start_date.blank?
    end

    def do_before_save
      self.abbreviation = abbreviation.upcase
    end

end
