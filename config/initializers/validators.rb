class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors[attribute] << (options[:message] || 'must be present and in the proper format (yyyy-mm-dd)')
    elsif value < '1961-01-01'.to_date
      record.errors[attribute] << (options[:message] || 'must be later than Jan 1, 1961')
    elsif value > Date.today
      record.errors[attribute] << (options[:message] || "must not be in the future: that just doesn't make sense!")
    end
  end
end

class AlphanumericValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^([a-z])+$/i
      record.errors[attribute] << (options[:message] || "is not alphanumeric")
    end
  end
end

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^https?:\/\/[a-z]+.[a-zA-Z]+[-\/0-9a-z_%?=.&]*$/i
      record.errors[attribute] << (options[:message] || "is not a valid URL (as far as we can tell)")
    end
  end
end

class Iso2Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if Carmen.country_name(value).nil?
      record.errors[attribute] << (options[:message] || "is not a valid ISO 2-letter country code")
    end
  end
end
