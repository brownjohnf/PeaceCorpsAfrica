class Country < ActiveRecord::Base
  rolify

  attr_accessible :code, :name, :page_id, :active, :num_volunteers, :num_total_volunteers, :contact_email, :site_url, :donate_url, :pc_start_date

  validates :name, :code, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :code, :length => { :minimum => 2, :maximum => 2 }
  validate :valid_date

  before_validation :do_before_validation

  default_scope order('name ASC')
  scope :active, where(:active => true)

  private

    def valid_date
      errors.add('PC Start Date', 'must be later than 1963') unless pc_start_date > '1963-01-01'.to_date
    end

    def do_before_validation
      self.name = Carmen.country_name(code)
      self.pc_start_date = pc_start_date.to_date
    end

end
