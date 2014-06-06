class ApiController < ActionController::Base

  skip_before_filter :verify_authenticity_token
  respond_to :json

  private
  
  def default_serializer_options
    {root: false}
  end


end