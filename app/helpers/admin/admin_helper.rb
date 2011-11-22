module Admin::AdminHelper

  # Check if menu must be display
  def display_menu?
    not in_dashboard?
  end

  # Check if sub-menu must be display and save sub-menu links
  def display_sub_menu?
    @sub_menus = nil

    # sub-menu for General Configuration
    if controller.is_a?(Admin::GeneralConfiguration::GeneralConfigurationController)
      @sub_menus = {
        '.users_management'       => admin_general_configuration_users_path,
        '.interfaces_management'  => '#',
        '.system_configuration'   => '#'
      }
    end

    @sub_menus
  end

  # Check if user is displaying Dashboard
  def in_dashboard?
    controller.controller_name == 'dashboard'
  end

  # TODO implémenter l'affichage du logo de la compagnie
  # Display logo of company in 120x120
  def logo_company_tag
    image_tag("Logo_leelah_system.png", :alt => "rails", :size => '390x150')
  end

  # TODO implémenter le calcul du nombre de clients par jour
  # Calculate numbers of clients today
  def calculate_nb_clients_today
    42
  end

end