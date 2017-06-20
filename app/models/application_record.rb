class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Method that updates the record's relationships, by taking JSON API format and converting
  # it to Rails format.
  def update_relationships(params)
    rails_params = {}

    # Build the params that the update_attributes method understands.
    params.keys.each do |key|
      record = key.capitalize.constantize.find(params[key]['data']['id'])
      rails_params[key.to_sym] = record
    end

    update_attributes(rails_params)
  end
end
