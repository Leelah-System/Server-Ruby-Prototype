module Admin::GeneralConfiguration::CompanyHelper

  def show_company?
    controller.controller_name == 'company' and controller.action_name == 'index'
  end

end
