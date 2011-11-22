class Admin::GeneralConfiguration::CompanyController < Admin::GeneralConfiguration::GeneralConfigurationController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :find_company


  #===========================================================================#
  #===   ACTIONS
  #===========================================================================#

  def index
  end

  def edit
    render "index"
  end

  def update

    #uploaded_io = params[:test]
    #if uploaded_io
    #  File.open(Rails.root.join('public', 'images', uploaded_io.original_filename), 'wb') do |file|
    #    file.write(uploaded_io.read)
    #  end
    #end

    if @company.update_attributes(params[:company])
      redirect_to(
          admin_general_configuration_company_path,
          :notice => t('admin.general_configuration.company.flash.notice.update_sucess')
      )
    else
      render "index"
    end
  end

  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  def find_company
    @company = Company.first
  end

end
