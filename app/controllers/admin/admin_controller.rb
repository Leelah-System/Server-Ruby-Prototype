class Admin::AdminController < ApplicationController
  protect_from_forgery

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :require_login, :require_admin_roles


  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  # Give current user id
  def current_user
    @_current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  # Check if user is logged
  def logged_in?
    !!current_user
  end

  # Callback uses to check if user is log in
  def require_login
    unless logged_in?
      flash[:error] = t('admin.flash.error.not_logged')
      redirect_to admin_login_path
    end
  end

  # Callback uses to check if user has 'admin' role
  def require_admin_roles
    if logged_in? and not current_user.has_admin_roles?
      not_authorized
    end
  end

  # Render "Not Authorized" page
  def not_authorized
    render :file => 'public/401.html', :status => 401, :layout => false
  end

end