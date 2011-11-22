module Admin::GeneralConfiguration::UsersHelper

  def show_user?
    controller.controller_name == 'users' and controller.action_name == 'show'
  end

end
