class URLBuilder

  # PUBLIC CLASS METHODS

  # Method that returns the URL for a resource.
  def self.url_for_resource(resource)

    # Convert class name to symbol.
    klass = resource.class.name.underscore.to_sym

    # Get the mapping for this resource class.
    base_url = url_mapper[klass]

    # Return the full URL.
    base_url + '/' + resource.id.to_s
  end

  # Method that returns the URL for a model.
  def self.url_for_model(model)

    # Convert class name to symbol.
    klass = model.name.underscore.to_sym

    # Return the full URL.
    url_mapper[klass]
  end

  # PRIVATE CLASS METHODS

  private

  # Method that maps a resource type to the correct base URL.
  def self.url_mapper
    {
      author: "#{ENV['DOMAIN_NAME']}/authors",
      poem: "#{ENV['DOMAIN_NAME']}/poems"
    }
  end
end