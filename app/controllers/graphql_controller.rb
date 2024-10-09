class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # You can provide things like the current user here, e.g.
      # current_user: current_user,
    }
    result = EarthquakeApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end

  private

  # Handle an empty params hash to avoid issues
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? JSON.parse(ambiguous_param) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    else
      {}
    end
  end
end
