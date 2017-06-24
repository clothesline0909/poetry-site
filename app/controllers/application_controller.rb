class ApplicationController < ActionController::API

  # CALLBACKS

  before_action :set_headers

  # RESCUES

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  private

  def set_headers
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    response.headers['Access-Control-Allow-Method'] = %w(OPTIONS GET POST PATCH DELETE).join(',')
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end

  def record_not_found_error(exception)
    @errors = [{
      status: 404,
      detail: exception.message
    }]

    render 'errors/errors', status: :not_found
  end

  def page_number
    params['page'].try(:[], 'number') || 1
  end

  def page_size
    params['page'].try(:[], 'size') || 25
  end

  def sort_params_array
    sort_params_array = []

    # Return default sort if no sorting specified.
    return [id: :asc] unless params['sort']

    # Get individual sort columns.
    sort_columns = params['sort'].split(',')

    # Create sort query for each column.
    sort_columns.each do |sort_column|

      # Default order is ascending.
      order = :asc

      # If sort column is preceeded by a minus, order descending.
      if sort_column.first == '-'
        order = :desc
        sort_column = sort_column[1..-1]
      end

      sort_params_array << { sort_column => order }
    end

    sort_params_array
  end
end
