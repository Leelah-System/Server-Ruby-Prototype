class Admin::SessionController < Admin::AdminController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  skip_before_filter :require_login, :require_admin_roles


  #===========================================================================#
  #===   ACTIONS
  #===========================================================================#

  # Display login page
  #
  # ====URL:
  # +GET+ +/admin/login+
  def login
  end

  # Authenticate an user
  #
  # ====URL
  # +POST+ +/admin/authenticate+
  def authenticate
    user = User.authenticate(params[:login], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => t('admin.session.notice.login')
    else
      flash.now[:error] = t('admin.session.notice.invalid_login')
      render "login"
    end

  end

  # Logout current user
  #
  # ====URL
  # +GET+ +/admin/logout+
  def logout
    @_current_user = session[:user_id] = nil
    redirect_to admin_login_path, :notice => t('admin.session.notice.logout')
  end

end
