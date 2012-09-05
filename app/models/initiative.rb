class Initiative < ActiveRecord::Base
  
  attr_accessible :name, :page_id, :start_date, :contact_email, :site_url, :donate_url, :country_initiatives_attributes, :abbreviation

  # requires name, start_date, abbreviation
  validates :name, :abbreviation, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :abbreviation, :length => { :minimum => 3, :maximum => 15 }, :uniqueness => true
  validates :name, :uniqueness => true
  validate :valid_date

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
      if start_date.blank?
        errors.add(:start_date, 'must be present and in the proper format (yyyy-mm-dd)')
      #elsif ((start_date.to_date rescue ArgumentError) == ArgumentError)
        #errors.add(:start_date, 'must be a valid date (yyyy-mm-dd)')
      elsif start_date < '1961-01-01'.to_date
        errors.add(:start_date, 'must be later than Jan 1, 1961')
      elsif start_date > Date.today
        errors.add(:start_date, "must not be in the future: that just doesn't make sense!")
      end
    end

    def do_before_validation
      self.start_date = start_date.to_date unless start_date.blank?
    end

    def do_before_save
      self.abbreviation = abbreviation.upcase
    end

end
