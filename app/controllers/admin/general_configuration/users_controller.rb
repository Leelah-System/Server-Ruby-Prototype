class Admin::GeneralConfiguration::UsersController < Admin::GeneralConfiguration::GeneralConfigurationController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :find_all_users, :only => [:index, :show, :new, :create, :edit, :update]


  #===========================================================================#
  #===   ACTIONS
  #===========================================================================#

  # GET /admin/general_configuration/users
  def index
    @show_form = false
  end

  # GET /admin/general_configuration/users/1
  def show
    @user = User.find(params[:id])
    render "index"
  end

  # GET /admin/general_configuration/users/new
  def new
    @user = User.new
    render "index"
  end

  # GET /admin/general_configuration/users/1/edit
  def edit
    @user = User.find(params[:id])
    render "index"
  end

  # POST /admin/general_configuration/users
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(admin_general_configuration_users_path, :notice => t('admin.general_configuration.users.flash.notice.create_success'))
    else
      render "index"
    end
  end

  # PUT /admin/general_configuration/users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(admin_general_configuration_users_path, :notice => t('admin.general_configuration.users.flash.notice.update_sucess'))
    else
      render "index"
    end
  end

  # DELETE /admin/general_configuration/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(admin_general_configuration_users_path, :notice => t('admin.general_configuration.users.flash.notice.delete_success'))
  end

  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  def find_all_users
    @users = User.all
    @show_form = true
  end

end
