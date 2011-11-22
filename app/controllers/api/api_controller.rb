class Api::ApiController < ApplicationController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :require_token


  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  # Give current user id
  def current_user
    @_current_user
  end

  # Check if "+token+" is provide and correspond to an user
  #
  # Display an error response if "+token+" doesn't match to any user
  #
  # Call by "+before_filter+" callback
  def require_token
    user = User.find_by_token(params[:token])
    if not user
      respond_to do |format|
        format.json { render :json => formatted_response(false, nil, 'Unauthorized'), :status => :unauthorized }
        format.xml { render :xml => formatted_response(false, nil, 'Unauthorized'), :status => :unauthorized }
      end
    else
      @_current_user = user.id
    end
  end

  # Returns a formatted response for API
  #
  # ====Parameters:
  #   "success"  => if request succeed (true or false)
  #   "result"    => result of the request (any type)
  #   "msg"       => message for the response (string or nil)
  def formatted_response(success, result, msg)
    {:success => success, :result => result, :msg => msg}
  end

end
