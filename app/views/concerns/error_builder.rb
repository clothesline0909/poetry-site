class ErrorBuilder

  # PUBLIC CLASS METHODS

  # This method builds the formatted error objects for the view.
  def self.errors_for(resource)
    formatted_errors = []

    # Build formatted error objects for each attribute on the resource.
    resource.errors.details.each do |attribute, errors|
      formatted_errors << formatted_errors_for_attribute(attribute, errors)
    end

    formatted_errors.flatten
  end

  private

  # This method returns the formatted errors associated with an attribute on the model.
  def self.formatted_errors_for_attribute(attribute, errors)
    errors.map do |error|
      {
        status: 400,
        detail: get_detail_message(error[:error], attribute, error[:value])
      }
    end
  end

  # This method returns the detail message for the formatted error.
  def self.get_detail_message(type, attribute, value)
    case type
    when :blank
      "#{attribute.capitalize} can't be blank."
    when :taken
      "#{attribute.capitalize} '#{value}' has already been taken."
    end
  end
end