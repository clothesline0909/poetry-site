class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Method that updates the record's relationships, by taking JSON API format and converting
  # it to Rails format.
  def assign_relationships(params)

    # Relationships key present?
    return unless params.key?('relationships')

    rails_params = {}

    # Build the params that the update_attributes method understands.
    params['relationships'].keys.each do |key|
      record = key.capitalize.constantize.find(params['relationships'][key]['data']['id'])
      rails_params[key.to_sym] = record
    end

    assign_attributes(rails_params)
  end
end
