module Concerns::StringValidator
  extend ::ActiveSupport::Concern

  MOBILE_NUMBER_REGEX = /\A[0]{1}?[6-9]{1}\d{9}\z/

  def validate_phone_number!(phone_number)
    unless phone_number.match(MOBILE_NUMBER_REGEX)
      raise ::RailsParam::Param::InvalidParameterError, "Invalid Phone number"
    end

    phone_number[-10..-1]
  end
end
